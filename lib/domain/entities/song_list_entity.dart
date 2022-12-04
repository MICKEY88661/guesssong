import '../../data/models/play_list.dart';

class SongListEntity {
  final String id;
  final String imageUrl;
  final String title;

  SongListEntity({
    required this.id,
    required this.imageUrl,
    required this.title,
  });

  factory SongListEntity.fromModel(PlayListModel model) {
    return SongListEntity(
      id: model.id ?? '',
      imageUrl: model.image ?? '',
      title: model.title ?? '',
    );
  }
}
