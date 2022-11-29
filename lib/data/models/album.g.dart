// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) => AlbumModel(
      artist: json['artist'] == null
          ? null
          : ArtistModel.fromJson(json['artist'] as Map<String, dynamic>),
      availableTerritories: (json['availableTerritories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      explicitness: json['explicitness'] as bool?,
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$AlbumModelToJson(AlbumModel instance) =>
    <String, dynamic>{
      'artist': instance.artist,
      'availableTerritories': instance.availableTerritories,
      'explicitness': instance.explicitness,
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'url': instance.url,
    };
