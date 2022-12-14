import '../../data/models/tracks.dart';
import 'album_entity.dart';
import 'artist_entity.dart';

class TrackEntity {
  final String id;
  final String name;
  final ArtistEntity artist;
  final AlbumEntity album;

  TrackEntity({
    required this.id,
    required this.name,
    required this.artist,
    required this.album,
  });

  factory TrackEntity.formModel(TrackModel model) {
    return TrackEntity(
      id: model.id ?? '',
      name: model.name ?? '',
      artist: ArtistEntity.fromModel(model.album!.artist!),
      album: AlbumEntity.fromModel(model.album!),
    );
  }
}
