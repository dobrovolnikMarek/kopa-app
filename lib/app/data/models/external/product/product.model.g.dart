// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      model: json['model'] as String,
      material: json['material'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photos': instance.photos,
      'model': instance.model,
      'material': instance.material,
      'description': instance.description,
      'price': instance.price,
      'userId': instance.userId,
    };
