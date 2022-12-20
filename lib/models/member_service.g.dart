// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MemberMobx on _MemberMobxBase, Store {
  late final _$membersAtom =
      Atom(name: '_MemberMobxBase.members', context: context);

  @override
  List<Member> get members {
    _$membersAtom.reportRead();
    return super.members;
  }

  @override
  set members(List<Member> value) {
    _$membersAtom.reportWrite(value, super.members, () {
      super.members = value;
    });
  }

  late final _$getAllMembersAsyncAction =
      AsyncAction('_MemberMobxBase.getAllMembers', context: context);

  @override
  Future<void> getAllMembers() {
    return _$getAllMembersAsyncAction.run(() => super.getAllMembers());
  }

  late final _$_MemberMobxBaseActionController =
      ActionController(name: '_MemberMobxBase', context: context);

  @override
  void refreshState() {
    final _$actionInfo = _$_MemberMobxBaseActionController.startAction(
        name: '_MemberMobxBase.refreshState');
    try {
      return super.refreshState();
    } finally {
      _$_MemberMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
members: ${members}
    ''';
  }
}
