import '../entities/quiz_entity.dart';
import '../entities/song_list_entity.dart';

abstract class ISongRepository {
  // 搜尋歌單(題庫)
  Future<List<SongListEntity>> searchPlayList(String keyword);
  // 取得題庫內容
  Future<QuizEntity> getQuiz(String playListId);
  // 取得歌曲預覽
  Future<String> getPreviewUrl(String songId);
  // 取得歌曲歌詞
  Future<String> getLiric({required String singer, required String song});
}
