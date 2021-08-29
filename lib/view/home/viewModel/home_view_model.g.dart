// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$listDataAtom = Atom(name: '_HomeViewModelBase.listData');

  @override
  List<homeModel.Data>? get listData {
    _$listDataAtom.reportRead();
    return super.listData;
  }

  @override
  set listData(List<homeModel.Data>? value) {
    _$listDataAtom.reportWrite(value, super.listData, () {
      super.listData = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeViewModelBase.isLoading');

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

  final _$userIdAtom = Atom(name: '_HomeViewModelBase.userId');

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

  final _$detailDataModelAtom =
      Atom(name: '_HomeViewModelBase.detailDataModel');

  @override
  Data get detailDataModel {
    _$detailDataModelAtom.reportRead();
    return super.detailDataModel;
  }

  @override
  set detailDataModel(Data value) {
    _$detailDataModelAtom.reportWrite(value, super.detailDataModel, () {
      super.detailDataModel = value;
    });
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void userIdChange(String id) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.userIdChange');
    try {
      return super.userIdChange(id);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listData: ${listData},
isLoading: ${isLoading},
userId: ${userId},
detailDataModel: ${detailDataModel}
    ''';
  }
}
