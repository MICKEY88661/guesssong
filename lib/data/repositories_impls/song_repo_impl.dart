import 'dart:convert';

import 'package:guesssong/domain/entities/song_list_entity.dart';
import 'package:guesssong/domain/entities/quiz_entity.dart';
import 'package:guesssong/domain/i_repositories/i_song_repo.dart';
import 'package:http/http.dart';

import '../core/uri_helper.dart';
import '../data_sources/remote_client.dart';
import '../models/play_list.dart';
import '../models/preview.dart';
import '../models/quiz.dart';

class SongRepository implements ISongRepository {
  final RemoteClient remoteClient;

  SongRepository({
    required this.remoteClient,
  });

  // @override
  // Future getLiric({
  //   required String singer,
  //   required String song,
  // }) async {
  //   try {
  //     final path = UriHelper.uri("get_lyric/$singer/$song");
  //     final Response response = await remoteClient.get(path);
  //     final bodyJson = jsonDecode(response.body);
  //     final preview = PreviewModel.fromJson(bodyJson);

  //     return preview.previewUrl ?? '';
  //   } catch (e) {
  //     print(e);
  //     return '';
  //   }
  // }

  @override
  Future<String> getPreviewUrl(String songId) async {
    try {
      final path = UriHelper.uri("get_preview/$songId");
      final Response response = await remoteClient.get(path);
      final bodyJson = jsonDecode(response.body);
      final preview = PreviewModel.fromJson(bodyJson);

      return preview.previewUrl ?? '';
    } catch (e) {
      print(e);
      return '';
    }
  }

  @override
  Future<QuizEntity> getQuiz(String playListId) async {
    try {
      final path = UriHelper.uri("get_quiz/$playListId");
      final Response response = await remoteClient.get(path);
      final bodyJson = jsonDecode(response.body);
      final quiz = QuizModel.fromJson(bodyJson);

      return QuizEntity.fromModel(quiz);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<List<SongListEntity>> searchPlayList(String keyword) async {
    try {
      List<SongListEntity> result = [];
      final path = UriHelper.uri("search_playlist/$keyword");
      final Response response = await remoteClient.get(path);
      final bodyJson = jsonDecode(response.body);
      final playLists = PlayListsModel.fromJson(bodyJson);

      if (playLists.data?.result != null) {
        for (PlayListModel playList in playLists.data!.result!) {
          result.add(
            SongListEntity.fromModel(playList),
          );
        }
      }

      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
