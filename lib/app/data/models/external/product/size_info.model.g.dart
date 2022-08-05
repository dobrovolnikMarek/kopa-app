// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SizeInfoModel _$SizeInfoModelFromJson(Map<String, dynamic> json) =>
    SizeInfoModel(
      size: (json['size'] as num).toDouble(),
      sizeType: json['sizeType'] as String,
      length: (json['length'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
    );

Map<String, dynamic> _$SizeInfoModelToJson(SizeInfoModel instance) =>
    <String, dynamic>{
      'size': instance.size,
      'sizeType': instance.sizeType,
      'length': instance.length,
      'width': instance.width,
    };
