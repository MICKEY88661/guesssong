// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistModel _$ArtistModelFromJson(Map<String, dynamic> json) => ArtistModel(
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ArtistModelToJson(ArtistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'url': instance.url,
    };
