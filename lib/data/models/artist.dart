import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'artist.g.dart';

@JsonSerializable()
class ArtistModel {
  final String? id;
  final List<ImageModel>? images;
  final String? name;
  final String? url;

  const ArtistModel({
    this.id,
    this.images,
    this.name,
    this.url,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistModelToJson(this);
}
