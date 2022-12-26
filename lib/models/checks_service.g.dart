// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checks_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckMobx on _CheckMobxBase, Store {
  late final _$checksAtom =
      Atom(name: '_CheckMobxBase.checks', context: context);

  @override
  List<CheckModel> get checks {
    _$checksAtom.reportRead();
    return super.checks;
  }

  @override
  set checks(List<CheckModel> value) {
    _$checksAtom.reportWrite(value, super.checks, () {
      super.checks = value;
    });
  }

  late final _$createCheckAsyncAction =
      AsyncAction('_CheckMobxBase.createCheck', context: context);

  @override
  Future<void> createCheck(
      {required String item_id,
      required String quantity,
      required String customer_id}) {
    return _$createCheckAsyncAction.run(() => super.createCheck(
        item_id: item_id, quantity: quantity, customer_id: customer_id));
  }

  late final _$getAllChecksAsyncAction =
      AsyncAction('_CheckMobxBase.getAllChecks', context: context);

  @override
  Future<void> getAllChecks() {
    return _$getAllChecksAsyncAction.run(() => super.getAllChecks());
  }

  @override
  String toString() {
    return '''
checks: ${checks}
    ''';
  }
}
