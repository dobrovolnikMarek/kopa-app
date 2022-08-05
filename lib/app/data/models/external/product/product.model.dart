import 'package:json_annotation/json_annotation.dart';
import 'package:kopa_app/app/data/models/external/product/size_info.model.dart';

part 'product.model.g.dart';

@JsonSerializable()
class ProductModel {
  String id;
  List<String> photos;
  String model;
  String material;
  String description;
  int price;
  String userId;
  double size;
  Map<String, dynamic> sizeInfo;
  // String sizeType;
  // double length;
  // double width;
  // SizeInfoModel sizeInfo;

  ProductModel({
    required this.id,
    required this.photos,
    required this.model,
    required this.material,
    required this.description,
    required this.price,
    required this.userId,
    required this.size,
    required this.sizeInfo,
    // required this.sizeType,
    // required this.length,
    // required this.width,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
