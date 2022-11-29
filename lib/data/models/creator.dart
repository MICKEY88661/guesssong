import 'package:json_annotation/json_annotation.dart';

part 'creator.g.dart';

@JsonSerializable()
class CreatorModel {
  final String? image;
  final String? name;
  final String? url;

  CreatorModel({
    this.image,
    this.name,
    this.url,
  });

  factory CreatorModel.fromJson(Map<String, dynamic> json) =>
      _$CreatorModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorModelToJson(this);
}
