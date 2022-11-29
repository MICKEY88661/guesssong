import 'package:json_annotation/json_annotation.dart';

import 'creator.dart';

part 'play_list.g.dart';

@JsonSerializable()
class PlayListsModel {
  final PlayListsDataModel? data;
  final PagingModel? paging;
  final String? status;

  PlayListsModel({
    this.data,
    this.paging,
    this.status,
  });

  factory PlayListsModel.fromJson(Map<String, dynamic> json) =>
      _$PlayListsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListsModelToJson(this);
}

@JsonSerializable()
class PagingModel {
  @JsonValue('next')
  final String? nextUrl;
  @JsonValue('previous')
  final String? previousUrl;

  PagingModel({
    this.nextUrl,
    this.previousUrl,
  });

  factory PagingModel.fromJson(Map<String, dynamic> json) =>
      _$PagingModelFromJson(json);

  Map<String, dynamic> toJson() => _$PagingModelToJson(this);
}

@JsonSerializable()
class PlayListsDataModel {
  final List<PlayListModel>? result;
  final String? type;

  PlayListsDataModel({
    this.result,
    this.type,
  });

  factory PlayListsDataModel.fromJson(Map<String, dynamic> json) =>
      _$PlayListsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListsDataModelToJson(this);
}

@JsonSerializable()
class PlayListModel {
  final CreatorModel? creator;
  final String? id;
  final String? image;
  @JsonValue('short_url')
  final String? shortURL;
  final String? title;
  final String? url;

  const PlayListModel({
    this.creator,
    this.id,
    this.image,
    this.shortURL,
    this.title,
    this.url,
  });

  factory PlayListModel.fromJson(Map<String, dynamic> json) =>
      _$PlayListModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListModelToJson(this);
}
