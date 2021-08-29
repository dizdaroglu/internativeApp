import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

@JsonSerializable()
class ProfileModel {
  ProfileModel({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data,
  });

  List<dynamic>? validationErrors;
  bool? hasError;
  dynamic? message;
  Data? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ProfileModelToJson(this);
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
