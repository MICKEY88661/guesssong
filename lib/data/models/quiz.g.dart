// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) => QuizModel(
      description: json['description'] as String?,
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      owner: json['owner'] == null
          ? null
          : OwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
      title: json['title'] as String?,
      tracks: json['tracks'] == null
          ? null
          : TracksModel.fromJson(json['tracks'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      'description': instance.description,
      'id': instance.id,
      'images': instance.images,
      'owner': instance.owner,
      'title': instance.title,
      'tracks': instance.tracks,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'url': instance.url,
    };
