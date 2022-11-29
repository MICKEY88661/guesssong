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
}
