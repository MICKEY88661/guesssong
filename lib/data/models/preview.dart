import 'package:json_annotation/json_annotation.dart';

part 'preview.g.dart';

@JsonSerializable()
class PreviewModel {
  final String? previewUrl;

  PreviewModel({this.previewUrl});

  factory PreviewModel.fromJson(Map<String, dynamic> json) =>
      _$PreviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$PreviewModelToJson(this);
}
