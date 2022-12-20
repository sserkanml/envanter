// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerMobx on _CustomerMobxBase, Store {
  late final _$customersAtom =
      Atom(name: '_CustomerMobxBase.customers', context: context);

  @override
  List<CustomerModel> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(List<CustomerModel> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  late final _$infoMessageAtom =
      Atom(name: '_CustomerMobxBase.infoMessage', context: context);

  @override
  String get infoMessage {
    _$infoMessageAtom.reportRead();
    return super.infoMessage;
  }

  @override
  set infoMessage(String value) {
    _$infoMessageAtom.reportWrite(value, super.infoMessage, () {
      super.infoMessage = value;
    });
  }

  late final _$customerPostDataAsyncAction =
      AsyncAction('_CustomerMobxBase.customerPostData', context: context);

  @override
  Future<void> customerPostData(
      {required String customerCompanyName,
      required String authorityName,
      required String customerEmail,
      required String customerPhone,
      required String taxPlace,
      required String taxNo,
      required String adress}) {
    return _$customerPostDataAsyncAction.run(() => super.customerPostData(
        customerCompanyName: customerCompanyName,
        authorityName: authorityName,
        customerEmail: customerEmail,
        customerPhone: customerPhone,
        taxPlace: taxPlace,
        taxNo: taxNo,
        adress: adress));
  }

  late final _$getAllCustomersAsyncAction =
      AsyncAction('_CustomerMobxBase.getAllCustomers', context: context);

  @override
  Future<void> getAllCustomers() {
    return _$getAllCustomersAsyncAction.run(() => super.getAllCustomers());
  }

  late final _$_CustomerMobxBaseActionController =
      ActionController(name: '_CustomerMobxBase', context: context);

  @override
  void refreshState() {
    final _$actionInfo = _$_CustomerMobxBaseActionController.startAction(
        name: '_CustomerMobxBase.refreshState');
    try {
      return super.refreshState();
    } finally {
      _$_CustomerMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customers: ${customers},
infoMessage: ${infoMessage}
    ''';
  }
}
