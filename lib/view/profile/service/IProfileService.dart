import '../model/profile_friends_model.dart';
import '../model/profile_model.dart';
import '../model/remove_user_model.dart';

abstract class IProfileService {
  Future<ProfileModel?> getProfile();
  Future<FriendListModel?> getFriends();
  Future<RemoveUserModel?> removeUser(String userId);
}
