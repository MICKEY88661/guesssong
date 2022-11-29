// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayListsModel _$PlayListsModelFromJson(Map<String, dynamic> json) =>
    PlayListsModel(
      data: json['data'] == null
          ? null
          : PlayListsDataModel.fromJson(json['data'] as Map<String, dynamic>),
      paging: json['paging'] == null
          ? null
          : PagingModel.fromJson(json['paging'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$PlayListsModelToJson(PlayListsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'paging': instance.paging,
      'status': instance.status,
    };

PagingModel _$PagingModelFromJson(Map<String, dynamic> json) => PagingModel(
      nextUrl: json['nextUrl'] as String?,
      previousUrl: json['previousUrl'] as String?,
    );

Map<String, dynamic> _$PagingModelToJson(PagingModel instance) =>
    <String, dynamic>{
      'nextUrl': instance.nextUrl,
      'previousUrl': instance.previousUrl,
    };

PlayListsDataModel _$PlayListsDataModelFromJson(Map<String, dynamic> json) =>
    PlayListsDataModel(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => PlayListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$PlayListsDataModelToJson(PlayListsDataModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'type': instance.type,
    };

PlayListModel _$PlayListModelFromJson(Map<String, dynamic> json) =>
    PlayListModel(
      creator: json['creator'] == null
          ? null
          : CreatorModel.fromJson(json['creator'] as Map<String, dynamic>),
      id: json['id'] as String?,
      image: json['image'] as String?,
      shortURL: json['shortURL'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PlayListModelToJson(PlayListModel instance) =>
    <String, dynamic>{
      'creator': instance.creator,
      'id': instance.id,
      'image': instance.image,
      'shortURL': instance.shortURL,
      'title': instance.title,
      'url': instance.url,
    };
