import 'package:guesssong/data/models/album.dart';

class AlbumEntity {
  final String id;
  final String name;
  final String imageUrl;

  AlbumEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
  factory AlbumEntity.fromModel(AlbumModel model) {
    return AlbumEntity(
      id: model.id ?? '',
      name: model.name ?? '',
      imageUrl: model.images?.first.url ?? '',
    );
  }
}
