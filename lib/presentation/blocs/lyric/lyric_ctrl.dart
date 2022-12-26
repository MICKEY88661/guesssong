import 'package:guesssong/presentation/blocs/lyric/lyric_state.dart';
import 'package:riverpod/riverpod.dart';

import '../../../domain/services/song_service.dart';

final lyricCtrlProvider =
    StateNotifierProvider<LyricController, LyricState>((ref) {
  final songService = ref.watch(songServiceProvider);
  const state = LyricState(
    lyric: AsyncValue.loading(),
  );
  return LyricController(
    state,
    songService: songService,
  );
});

class LyricController extends StateNotifier<LyricState> {
  final SongService songService;
  LyricController(
    super.state, {
    required this.songService,
  });

  void typed(String songName) {
    state = state.copywith(songName: songName);
  }

  Future<void> getLyric() async {
    try {
      if (state.songName?.isEmpty ?? true) return;

      state = state.copywith(lyric: const AsyncValue.loading());
      final lyrics = await songService.getLyric(
        singerName: '林俊傑',
        songName: state.songName!, //'超越無限',
      );
      state = state.copywith(lyric: AsyncData(lyrics));
    } catch (e, s) {
      print('error:$e');
      state = state.copywith(lyric: AsyncValue.error(e, s));
    }
  }
}
