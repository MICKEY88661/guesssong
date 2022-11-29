import 'package:json_annotation/json_annotation.dart';

import 'artist.dart';
import 'image.dart';

part 'album.g.dart';

@JsonSerializable()
class AlbumModel {
  final ArtistModel? artist;
  @JsonValue('available_territories')
  final List<String>? availableTerritories;
  final bool? explicitness;
  final String? id;
  final List<ImageModel>? images;
  final String? name;
  @JsonValue('release_date')
  final DateTime? releaseDate;
  final String? url;

  const AlbumModel({
    this.artist,
    this.availableTerritories,
    this.explicitness,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.url,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
}
