import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? phone;
  String? firstName;
  String? lastName;
  String? city;
  String? imgUrl;
  String? email;

  UserModel({
    this.id,
    this.phone,
    this.firstName,
    this.lastName,
    this.city,
    this.imgUrl,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
