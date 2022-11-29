import 'package:json_annotation/json_annotation.dart';

import 'album.dart';
import 'summary.dart';

part 'tracks.g.dart';

@JsonSerializable()
class TracksModel {
  final List<TrackModel>? data;
  final PagingModel? paging;
  final SummaryModel? summary;

  TracksModel({
    this.data,
    this.paging,
    this.summary,
  });

  factory TracksModel.fromJson(Map<String, dynamic> json) =>
      _$TracksModelFromJson(json);

  Map<String, dynamic> toJson() => _$TracksModelToJson(this);
}

@JsonSerializable()
class TrackModel {
  final AlbumModel? album;
  @JsonValue('available_territories')
  final List<String>? availableTerritories;
  final int? duration;
  final bool? explicitness;
  final String? id;
  final String? isrc;
  final String? name;
  @JsonValue('track_number')
  final int? trackNumber;
  final String? url;

  TrackModel({
    this.album,
    this.availableTerritories,
    this.duration,
    this.explicitness,
    this.id,
    this.isrc,
    this.name,
    this.trackNumber,
    this.url,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) =>
      _$TrackModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrackModelToJson(this);
}

@JsonSerializable()
class PagingModel {
  final int? limit;
  final int? offset;

  PagingModel({
    this.limit,
    this.offset,
  });

  factory PagingModel.fromJson(Map<String, dynamic> json) =>
      _$PagingModelFromJson(json);

  Map<String, dynamic> toJson() => _$PagingModelToJson(this);
}
