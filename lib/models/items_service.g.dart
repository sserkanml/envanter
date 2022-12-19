// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemsMobx on _ItemsMobxBase, Store {
  late final _$itemsAtom = Atom(name: '_ItemsMobxBase.items', context: context);

  @override
  List<ItemsModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<ItemsModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$getAllItemsAsyncAction =
      AsyncAction('_ItemsMobxBase.getAllItems', context: context);

  @override
  Future<void> getAllItems() {
    return _$getAllItemsAsyncAction.run(() => super.getAllItems());
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
