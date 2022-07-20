import 'package:json_annotation/json_annotation.dart';

part 'product.model.g.dart';

@JsonSerializable()
class ProductModel {
  String id;
  List<String> photos;
  String model;
  String material;
  String description;
  String price;
  String userId;

  ProductModel({
    required this.id,
    required this.photos,
    required this.model,
    required this.material,
    required this.description,
    required this.price,
    required this.userId,

  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
