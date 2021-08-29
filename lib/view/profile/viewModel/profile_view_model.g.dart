// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  final _$profileModelAtom = Atom(name: '_ProfileViewModelBase.profileModel');

  @override
  ProfileModel get profileModel {
    _$profileModelAtom.reportRead();
    return super.profileModel;
  }

  @override
  set profileModel(ProfileModel value) {
    _$profileModelAtom.reportWrite(value, super.profileModel, () {
      super.profileModel = value;
    });
  }

  final _$friendListAtom = Atom(name: '_ProfileViewModelBase.friendList');

  @override
  List<String> get friendList {
    _$friendListAtom.reportRead();
    return super.friendList;
  }

  @override
  set friendList(List<String> value) {
    _$friendListAtom.reportWrite(value, super.friendList, () {
      super.friendList = value;
    });
  }

  final _$dataAtom = Atom(name: '_ProfileViewModelBase.data');

  @override
  List<friends.Data>? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<friends.Data>? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ProfileViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLoadingFriendAtom =
      Atom(name: '_ProfileViewModelBase.isLoadingFriend');

  @override
  bool get isLoadingFriend {
    _$isLoadingFriendAtom.reportRead();
    return super.isLoadingFriend;
  }

  @override
  set isLoadingFriend(bool value) {
    _$isLoadingFriendAtom.reportWrite(value, super.isLoadingFriend, () {
      super.isLoadingFriend = value;
    });
  }

  final _$userIdAtom = Atom(name: '_ProfileViewModelBase.userId');

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  final _$_ProfileViewModelBaseActionController =
      ActionController(name: '_ProfileViewModelBase');

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void userIdChange(String id) {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.userIdChange');
    try {
      return super.userIdChange(id);
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoadingFriendChange() {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.isLoadingFriendChange');
    try {
      return super.isLoadingFriendChange();
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profileModel: ${profileModel},
friendList: ${friendList},
data: ${data},
isLoading: ${isLoading},
isLoadingFriend: ${isLoadingFriend},
userId: ${userId}
    ''';
  }
}
