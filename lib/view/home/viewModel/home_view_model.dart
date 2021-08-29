import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/extension/context_extension.dart';
import '../../profile/service/profile_service.dart';
import '../model/detail_model.dart';
import '../model/home_model.dart' as homeModel;
import '../service/home_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  BuildContext? context;
  HomeService? service;
  ProfileService? profileService;

  void setContext(BuildContext context) => this.context = context;
  void init() {
    service = HomeService();
    profileService = ProfileService();
    fetchUsers();
  }

  @observable
  List<homeModel.Data>? listData = [];

  @observable
  bool isLoading = false;

  @observable
  String userId = "";

  @observable
  Data detailDataModel = Data();

  @action
  void isLoadingChange() => isLoading = !isLoading;

  @action
  void userIdChange(String id) {
    userId = id;
    fetchUserDetail();
  }

  Future fetchUsers() async {
    isLoadingChange();

    final response = await service!.getUsers();

    if (response != null) {
      if (!(response.hasError!)) {
        listData = response.data;
      }
    }
    isLoadingChange();
  }

  Future addToFriend(String? id) async {
    final response = await service!.addUser(id!);
    if (response != null) {
      ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
        content: Text(response.message!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: response.hasError == false ? context!.colors.primary : context!.colors.secondary,
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  Future fetchUserDetail() async {
    final response = await service!.userDetail(userId);
    if (response != null) {
      if (!(response.hasError!)) {
        detailDataModel = Data(
            birthDate: response.data!.birthDate,
            email: response.data!.email,
            firstName: response.data!.firstName,
            friendIds: response.data!.friendIds,
            fullName: response.data!.fullName,
            id: response.data!.id,
            lastName: response.data!.lastName,
            profilePhoto: response.data!.profilePhoto);
        navigationService.navigateToPage(path: "/detail", data: detailDataModel);
      } else {
        ScaffoldMessenger.of(context!).showSnackBar(
          SnackBar(
            content: Text(response.message!),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: context!.colors.secondary,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }
}
