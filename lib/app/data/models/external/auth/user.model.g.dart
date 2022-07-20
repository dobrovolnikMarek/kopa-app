// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      phone: json['phone'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      city: json['city'] as String?,
      imgUrl: json['imgUrl'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'city': instance.city,
      'imgUrl': instance.imgUrl,
      'email': instance.email,
    };
