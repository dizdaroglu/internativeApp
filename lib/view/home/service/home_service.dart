import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/constants/enums/network_enum.dart';
import '../../../core/constants/enums/preferences_key_enum.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../model/add_user_model.dart';
import '../model/detail_model.dart';
import '../model/home_model.dart';
import 'IHomeService.dart';

class HomeService extends IHomeService {
  @override
  Future<HomeModel?> getUsers() async {
    final response = await http.get(Uri.parse(NetworkUrl.GET_USERS.rawValue), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}',
    });
    if (response.statusCode == 200) {
      return homeModelFromJson(response.body);
    }
  }

  @override
  Future<AddUserModel?> addUser(String userId) async {
    Map data = {"UserId": userId};

    String body = json.encode(data);
    var a = Uri.parse("http://test11.internative.net​/User​/AddToFriends");
    var b = a.toString().replaceAll("%E2%80%8B", "");

    final response = await http.post(Uri.parse(b),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}',
        },
        body: body);

    if (response.statusCode == 200) {
      return addUserModelFromJson(response.body);
    }
  }

  @override
  Future<DetailModel?> userDetail(String userId) async {
    Map data = {"Id": userId};

    String body = json.encode(data);

    final response = await http.post(Uri.parse(NetworkUrl.GET_USER_DETAILS.rawValue),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}',
        },
        body: body);

    if (response.statusCode == 200) {
      return detailModelFromJson(response.body);
    }
  }
}
