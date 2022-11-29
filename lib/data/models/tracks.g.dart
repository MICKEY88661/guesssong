// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TracksModel _$TracksModelFromJson(Map<String, dynamic> json) => TracksModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TrackModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      paging: json['paging'] == null
          ? null
          : PagingModel.fromJson(json['paging'] as Map<String, dynamic>),
      summary: json['summary'] == null
          ? null
          : SummaryModel.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TracksModelToJson(TracksModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'paging': instance.paging,
      'summary': instance.summary,
    };

TrackModel _$TrackModelFromJson(Map<String, dynamic> json) => TrackModel(
      album: json['album'] == null
          ? null
          : AlbumModel.fromJson(json['album'] as Map<String, dynamic>),
      availableTerritories: (json['availableTerritories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      duration: json['duration'] as int?,
      explicitness: json['explicitness'] as bool?,
      id: json['id'] as String?,
      isrc: json['isrc'] as String?,
      name: json['name'] as String?,
      trackNumber: json['trackNumber'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$TrackModelToJson(TrackModel instance) =>
    <String, dynamic>{
      'album': instance.album,
      'availableTerritories': instance.availableTerritories,
      'duration': instance.duration,
      'explicitness': instance.explicitness,
      'id': instance.id,
      'isrc': instance.isrc,
      'name': instance.name,
      'trackNumber': instance.trackNumber,
      'url': instance.url,
    };

PagingModel _$PagingModelFromJson(Map<String, dynamic> json) => PagingModel(
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
    );

Map<String, dynamic> _$PagingModelToJson(PagingModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
    };
