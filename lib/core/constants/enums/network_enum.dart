import '../../helper/ui_helper.dart';

enum NetworkUrl { SIGN_IN, GET_USER_DETAILS, ADD_TO_FRIENDS, REMOVE_FROM_FRIENDS, GET_USERS, GET_FRIEND_LIST, GET }

extension NetworkRoutesString on NetworkUrl {
  String get rawValue {
    switch (this) {
      case NetworkUrl.SIGN_IN:
        return "${UIHelper.baseURL}/Login/SignIn";
      case NetworkUrl.GET_FRIEND_LIST:
        return "${UIHelper.baseURL}/Account/GetFriendList";
      case NetworkUrl.ADD_TO_FRIENDS:
        return "${UIHelper.baseURL}​/User​/AddToFriends";
      case NetworkUrl.REMOVE_FROM_FRIENDS:
        return "${UIHelper.baseURL}/User/RemoveFromFriends";
      case NetworkUrl.GET_USER_DETAILS:
        return "${UIHelper.baseURL}/User/GetUserDetails";
      case NetworkUrl.GET_USERS:
        return "${UIHelper.baseURL}/User/GetUsers";

      case NetworkUrl.GET:
        return "${UIHelper.baseURL}/Account/GET";
      default:
        throw Exception("error NetworkRoutesString");
    }
  }
}
