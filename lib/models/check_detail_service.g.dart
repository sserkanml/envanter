// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_detail_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckDetailMobx on _CheckDetailMobxBase, Store {
  late final _$checksDetailAtom =
      Atom(name: '_CheckDetailMobxBase.checksDetail', context: context);

  @override
  List<CheckDetailModel> get checksDetail {
    _$checksDetailAtom.reportRead();
    return super.checksDetail;
  }

  @override
  set checksDetail(List<CheckDetailModel> value) {
    _$checksDetailAtom.reportWrite(value, super.checksDetail, () {
      super.checksDetail = value;
    });
  }

  late final _$getAllChekcDetailAsyncAction =
      AsyncAction('_CheckDetailMobxBase.getAllChekcDetail', context: context);

  @override
  Future<void> getAllChekcDetail() {
    return _$getAllChekcDetailAsyncAction.run(() => super.getAllChekcDetail());
  }

  @override
  String toString() {
    return '''
checksDetail: ${checksDetail}
    ''';
  }
}
