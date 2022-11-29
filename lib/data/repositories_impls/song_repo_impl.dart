import 'package:guesssong/domain/entities/song_list_entity.dart';
import 'package:guesssong/domain/entities/quiz_entity.dart';
import 'package:guesssong/domain/i_repositories/i_song_repo.dart';

import '../data_sources/remote_client.dart';

class SongRepository implements ISongRepository {
  final RemoteClient remoteClient;

  SongRepository({
    required this.remoteClient,
  });

  @override
  Future getLiric({required String singer, required String song}) {
    // TODO: implement getLiric
    throw UnimplementedError();
  }

  @override
  Future<String> getPreviewUrl(String songId) {
    // TODO: implement getPreview
    throw UnimplementedError();
  }

  @override
  Future<QuizEntity> getQuiz(String playListId) {
    // TODO: implement getQuiz
    throw UnimplementedError();
  }

  @override
  Future<List<SongListEntity>> searchPlayList(String keyword) {
    // TODO: implement searchPlayList
    throw UnimplementedError();
  }
}
