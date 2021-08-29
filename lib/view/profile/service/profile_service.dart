import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/constants/enums/network_enum.dart';
import '../../../core/constants/enums/preferences_key_enum.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../model/profile_friends_model.dart';
import '../model/profile_model.dart';
import '../model/remove_user_model.dart';
import 'IProfileService.dart';

class ProfileService extends IProfileService {
  @override
  Future<ProfileModel?> getProfile() async {
    final response = await http.get(Uri.parse(NetworkUrl.GET.rawValue), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}',
    });
    if (response.statusCode == 200) {
      return profileModelFromJson(response.body);
    }
  }

  @override
  Future<FriendListModel?> getFriends() async {
    final response = await http.get(Uri.parse(NetworkUrl.GET_FRIEND_LIST.rawValue), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}',
    });
    if (response.statusCode == 200) {
      return friendListModelFromJson(response.body);
    }
  }

  @override
  Future<RemoveUserModel?> removeUser(String userId) async {
    Map data = {"UserId": userId};

    String body = json.encode(data);

    final response = await http.post(Uri.parse(NetworkUrl.REMOVE_FROM_FRIENDS.rawValue),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}',
        },
        body: body);

    if (response.statusCode == 200) {
      return removeUserModelFromJson(response.body);
    }
  }
}
