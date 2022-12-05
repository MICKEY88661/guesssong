import 'package:guesssong/domain/i_repositories/i_song_repo.dart';
import 'package:riverpod/riverpod.dart';

import '../../data/repositories_impls/song_repo_impl.dart';
import '../entities/quiz_entity.dart';
import '../entities/song_list_entity.dart';

final songServiceProvider = Provider((ref) {
  final songRepo = ref.watch<ISongRepository>(songRepoProvider);
  return SongService(
    songRepo: songRepo,
  );
});

class SongService {
  final ISongRepository songRepo;

  SongService({
    required this.songRepo,
  });

  Future<List<SongListEntity>> searchQuestionBase(String keyword) =>
      songRepo.searchPlayList(keyword);

  Future<QuizEntity> getQuiz(String playListId) => songRepo.getQuiz(playListId);

  Future<String> getPreviewUrl(String songId) => songRepo.getPreviewUrl(songId);
}
