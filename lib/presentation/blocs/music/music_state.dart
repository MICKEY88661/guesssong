part of 'music_ctrl.dart';

class MusicState extends Equatable {
  final String searchKeyWord;
  final String selectedSongListId;
  final AsyncValue<List<SongListEntity>> songLists;
  final AsyncValue<QuizEntity> quiz;
  final TrackEntity? currentTrack;

  const MusicState({
    required this.searchKeyWord,
    required this.selectedSongListId,
    required this.songLists,
    required this.quiz,
    this.currentTrack,
  });

  MusicState copyWith({
    String? searchKeyWord,
    String? selectedSongListId,
    AsyncValue<List<SongListEntity>>? songLists,
    AsyncValue<QuizEntity>? quiz,
    TrackEntity? currentTrack,
  }) {
    return MusicState(
      selectedSongListId: selectedSongListId ?? this.selectedSongListId,
      searchKeyWord: searchKeyWord ?? this.searchKeyWord,
      songLists: songLists ?? this.songLists,
      quiz: quiz ?? this.quiz,
      currentTrack: currentTrack ?? this.currentTrack,
    );
  }

  @override
  List<Object?> get props => [
        searchKeyWord,
        selectedSongListId,
        songLists,
        quiz,
        currentTrack,
      ];
}
