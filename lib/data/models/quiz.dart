import 'package:json_annotation/json_annotation.dart';

import 'image.dart';
import 'owner.dart';
import 'tracks.dart';

part 'quiz.g.dart';

@JsonSerializable()
class QuizModel {
  final String? description;
  final String? id;
  final List<ImageModel>? images;
  final OwnerModel? owner;
  final String? title;
  final TracksModel? tracks;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final String? url;

  const QuizModel({
    this.description,
    this.id,
    this.images,
    this.owner,
    this.title,
    this.tracks,
    this.updatedAt,
    this.url,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuizModelToJson(this);
}
