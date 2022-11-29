import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'owner.g.dart';

@JsonSerializable()
class OwnerModel {
  final String? description;
  final String? id;
  final List<ImageModel>? images;
  final String? name;
  final String? url;

  const OwnerModel({
    this.description,
    this.id,
    this.images,
    this.name,
    this.url,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerModelToJson(this);
}
