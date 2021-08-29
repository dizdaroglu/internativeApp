import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'profile_friends_model.g.dart';

FriendListModel friendListModelFromJson(String str) => FriendListModel.fromJson(json.decode(str));

String friendListModelToJson(FriendListModel data) => json.encode(data.toJson());

@JsonSerializable()
class FriendListModel {
  FriendListModel({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data,
  });

  List<dynamic>? validationErrors;
  bool? hasError;
  dynamic? message;
  List<Data>? data;

  factory FriendListModel.fromJson(Map<String, dynamic> json) => _$FriendListModelFromJson(json);
  Map<String, dynamic> toJson() {
    return _$FriendListModelToJson(this);
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
  List<dynamic>? friendIds;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}
