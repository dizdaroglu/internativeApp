import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

@JsonSerializable()
class HomeModel {
  HomeModel({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data,
  });

  List<dynamic>? validationErrors;
  bool? hasError;
  dynamic? message;
  List<Data>? data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(this);
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
