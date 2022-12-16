// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserSession on _UserSessionBase, Store {
  late final _$sessionIdAtom =
      Atom(name: '_UserSessionBase.sessionId', context: context);

  @override
  String get sessionId {
    _$sessionIdAtom.reportRead();
    return super.sessionId;
  }

  @override
  set sessionId(String value) {
    _$sessionIdAtom.reportWrite(value, super.sessionId, () {
      super.sessionId = value;
    });
  }

  late final _$_UserSessionBaseActionController =
      ActionController(name: '_UserSessionBase', context: context);

  @override
  void getId({required String id}) {
    final _$actionInfo = _$_UserSessionBaseActionController.startAction(
        name: '_UserSessionBase.getId');
    try {
      return super.getId(id: id);
    } finally {
      _$_UserSessionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sessionId: ${sessionId}
    ''';
  }
}
