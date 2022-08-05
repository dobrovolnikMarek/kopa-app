import 'package:json_annotation/json_annotation.dart';

part 'size_info.model.g.dart';

@JsonSerializable()
class SizeInfoModel {
  double size;
  String sizeType;
  double length;
  double width;

  SizeInfoModel({
    required this.size,
    required this.sizeType,
    required this.length,
    required this.width,
  });

  factory SizeInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SizeInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SizeInfoModelToJson(this);
}
