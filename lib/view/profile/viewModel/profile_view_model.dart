import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/extension/context_extension.dart';
import '../model/profile_friends_model.dart' as friends;
import '../model/profile_model.dart';
import '../service/profile_service.dart';

part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  BuildContext? context;
  ProfileService? service;

  void setContext(BuildContext context) => this.context = context;
  void init() {
    service = ProfileService();
    fetchProfile();
    fetchFriends();
  }

  @observable
  ProfileModel profileModel = ProfileModel();

  @observable
  List<String> friendList = [];

  @observable
  List<friends.Data>? data = [];

  @observable
  bool isLoading = false;

  @action
  void isLoadingChange() => isLoading = !isLoading;

  @observable
  bool isLoadingFriend = false;

  @observable
  String userId = "";

  @action
  void userIdChange(String id) {
    userId = id;
    removeUserFunc();
  }

  @action
  void isLoadingFriendChange() => isLoadingFriend = !isLoadingFriend;

  fetchProfile() async {
    isLoadingChange();
    final response = await service!.getProfile();

    if (response != null) {
      if (!(response.hasError!)) {
        profileModel =
            ProfileModel(data: response.data, hasError: response.hasError, message: response.message, validationErrors: response.validationErrors);
        friendList = response.data!.friendIds!;
      }
    }
    isLoadingChange();
  }

  fetchFriends() async {
    isLoadingFriendChange();
    final response = await service!.getFriends();

    if (response != null) {
      if (!(response.hasError!)) {
        data = response.data!;
      }
    }
    isLoadingFriendChange();
  }

  removeUserFunc() async {
    final response = await service!.removeUser(userId);

    if (response != null) {
      fetchFriends();
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          content: Text(response.message!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: context!.colors.primary,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
