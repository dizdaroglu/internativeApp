// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_friends_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendListModel _$FriendListModelFromJson(Map<String, dynamic> json) {
  return FriendListModel(
    validationErrors: json['ValidationErrors'] as List<dynamic>?,
    hasError: json['HasError'] as bool?,
    message: json['Message'],
    data: (json['Data'] as List<dynamic>?)?.map((e) => Data.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$FriendListModelToJson(FriendListModel instance) => <String, dynamic>{
      'ValidationErrors': instance.validationErrors,
      'HasError': instance.hasError,
      'Message': instance.message,
      'Data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['Id'] as String?,
    firstName: json['FirstName'] as String?,
    lastName: json['LastName'] as String?,
    fullName: json['FullName'] as String?,
    email: json['Email'] as String?,
    birthDate: json['BirthDate'] == null ? null : DateTime.parse(json['BirthDate'] as String),
    profilePhoto: json['ProfilePhoto'] as String?,
    friendIds: json['FriendIds'] as List<dynamic>?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'Id': instance.id,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'FullName': instance.fullName,
      'Email': instance.email,
      'BirthDate': instance.birthDate?.toIso8601String(),
      'ProfilePhoto': instance.profilePhoto,
      'FriendIds': instance.friendIds,
    };
