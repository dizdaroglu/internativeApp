import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'detail_model.g.dart';

DetailModel detailModelFromJson(String str) => DetailModel.fromJson(json.decode(str));

String detailModelToJson(DetailModel data) => json.encode(data.toJson());

@JsonSerializable()
class DetailModel {
  DetailModel({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data,
  });

  List<dynamic>? validationErrors;
  bool? hasError;
  dynamic? message;
  Data? data;

  factory DetailModel.fromJson(Map<String, dynamic> json) => _$DetailModelFromJson(json);
  Map<String, dynamic> toJson() {
    return _$DetailModelToJson(this);
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
