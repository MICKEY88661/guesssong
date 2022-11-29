import 'package:json_annotation/json_annotation.dart';

part 'summary.g.dart';

@JsonSerializable()
class SummaryModel {
  final int? total;

  SummaryModel(this.total);

  factory SummaryModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryModelToJson(this);
}
