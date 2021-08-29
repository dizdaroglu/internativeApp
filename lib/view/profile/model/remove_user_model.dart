import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'remove_user_model.g.dart';

RemoveUserModel removeUserModelFromJson(String str) => RemoveUserModel.fromJson(json.decode(str));

String removeUserModelToJson(RemoveUserModel data) => json.encode(data.toJson());

@JsonSerializable()
class RemoveUserModel {
  RemoveUserModel({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data,
  });

  List<dynamic>? validationErrors;
  bool? hasError;
  String? message;
  Data? data;

  factory RemoveUserModel.fromJson(Map<String, dynamic> json) => _$RemoveUserModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$RemoveUserModelToJson(this);
  }
}

@JsonSerializable()
class Data {
  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.birthDate,
    this.profilePhoto,
    this.friendIds,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  DateTime? birthDate;
  String? profilePhoto;
  List<String>? friendIds;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}
