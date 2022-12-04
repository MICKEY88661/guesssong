import 'package:guesssong/data/models/artist.dart';

class ArtistEntity {
  final String id;
  final String name;
  final String imageUrl;

  ArtistEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory ArtistEntity.fromModel(ArtistModel model) {
    return ArtistEntity(
      id: model.id ?? '',
      name: model.name ?? '',
      imageUrl: model.images!.first.url!,
    );
  }
}
