import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:guesssong/domain/services/song_service.dart';
import 'package:riverpod/riverpod.dart';

import '../../../domain/entities/quiz_entity.dart';
import '../../../domain/entities/song_list_entity.dart';
import '../../../domain/entities/track_entity.dart';

part 'music_state.dart';

final musicCtrlProvider =
    StateNotifierProvider<MusicController, MusicState>((ref) {
  final songService = ref.watch(songServiceProvider);
  return MusicController(
    const MusicState(
      selectedSongListId: '',
      searchKeyWord: '',
      songLists: AsyncLoading(),
      quiz: AsyncLoading(),
    ),
    songService: songService,
  );
});

class MusicController extends StateNotifier<MusicState> {
  final SongService songService;
  MusicController(
    super.state, {
    required this.songService,
  });

  void searchKeywordTyped(String s) {
    state = state.copyWith(searchKeyWord: s);
  }

  void quizSelected(String id) {
    state.selectedSongListId == id
        ? state = state.copyWith(selectedSongListId: '')
        : state = state.copyWith(selectedSongListId: id);
  }

  Future<void> searchQuestionBase() async {
    try {
      state = state.copyWith(songLists: const AsyncValue.loading());
      final result = await songService.searchQuestionBase(state.searchKeyWord);
      state = state.copyWith(songLists: AsyncValue.data(result));
    } catch (e, s) {
      print(e);
      state = state.copyWith(songLists: AsyncValue.error(e, s));
    }
  }

  Future<void> getQuiz() async {
    try {
      if (state.selectedSongListId == '') return;
      state = state.copyWith(quiz: const AsyncLoading());
      final result = await songService.getQuiz(state.selectedSongListId);
      state = state.copyWith(quiz: AsyncValue.data(result));
    } catch (e, s) {
      print(e);
      state = state.copyWith(songLists: AsyncValue.error(e, s));
    }
  }

  Future<String> getMusicPreview() async {
    try {
      final tracks = state.quiz.value?.tracks;
      if (tracks == null || tracks.isEmpty) {
        return 'empty';
      }
      final songIndex = Random().nextInt(tracks.length);
      final track = tracks.elementAt(songIndex);
      state = state.copyWith(currentTrack: track);
      return await songService.getPreviewUrl(track.id);
    } catch (e, s) {
      print(e);
      return '';
    }
  }
}
