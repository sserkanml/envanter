// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanned_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScannedListMobx on _ScannedListMobxBase, Store {
  late final _$scannedListAtom =
      Atom(name: '_ScannedListMobxBase.scannedList', context: context);

  @override
  ObservableList<NewCheckedList> get scannedList {
    _$scannedListAtom.reportRead();
    return super.scannedList;
  }

  @override
  set scannedList(ObservableList<NewCheckedList> value) {
    _$scannedListAtom.reportWrite(value, super.scannedList, () {
      super.scannedList = value;
    });
  }

  late final _$_ScannedListMobxBaseActionController =
      ActionController(name: '_ScannedListMobxBase', context: context);

  @override
  void addDoneList(
      {required String name,
      required String itemId,
      required String customerId,
      required String unit,
      required ItemsModel item,
      required double quantity}) {
    final _$actionInfo = _$_ScannedListMobxBaseActionController.startAction(
        name: '_ScannedListMobxBase.addDoneList');
    try {
      return super.addDoneList(
          name: name,
          itemId: itemId,
          customerId: customerId,
          unit: unit,
          item: item,
          quantity: quantity);
    } finally {
      _$_ScannedListMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearList() {
    final _$actionInfo = _$_ScannedListMobxBaseActionController.startAction(
        name: '_ScannedListMobxBase.clearList');
    try {
      return super.clearList();
    } finally {
      _$_ScannedListMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isContain(String name) {
    final _$actionInfo = _$_ScannedListMobxBaseActionController.startAction(
        name: '_ScannedListMobxBase.isContain');
    try {
      return super.isContain(name);
    } finally {
      _$_ScannedListMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateList({required String name, required double quantity}) {
    final _$actionInfo = _$_ScannedListMobxBaseActionController.startAction(
        name: '_ScannedListMobxBase.updateList');
    try {
      return super.updateList(name: name, quantity: quantity);
    } finally {
      _$_ScannedListMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scannedList: ${scannedList}
    ''';
  }
}
