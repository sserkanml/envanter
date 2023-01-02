// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:aden_envanterus/core/model/base_model.dart';
import 'package:aden_envanterus/models/items_model.dart';

class NewCheckedList implements IBaseModel<NewCheckedList> {
  final String name;
  double quantity = 0;
  final String itemId;
  final String customerId;
  final String unit;
  final ItemsModel item;
  NewCheckedList({
    required this.name,
    required this.quantity,
    required this.itemId,
    required this.customerId,
    required this.unit,
    required this.item,
  });

  NewCheckedList copyWith({
    String? name,
    double? quantity,
    String? itemId,
    String? customerId,
    String? unit,
    ItemsModel? item,
  }) {
    return NewCheckedList(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      itemId: itemId ?? this.itemId,
      customerId: customerId ?? this.customerId,
      unit: unit ?? this.unit,
      item: item ?? this.item,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'quantity': quantity,
      'itemId': itemId,
      'customerId': customerId,
      'unit': unit,
      'item': item.toMap(),
    };
  }

  factory NewCheckedList.fromMap(Map<String, dynamic> map) {
    return NewCheckedList(
      name: map['name'] as String,
      quantity: map['quantity'] as double,
      itemId: map['itemId'] as String,
      customerId: map['customerId'] as String,
      unit: map['unit'] as String,
      item: ItemsModel.fromMap(map['item'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewCheckedList.fromJson(String source) =>
      NewCheckedList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewCheckedList(name: $name, quantity: $quantity, itemId: $itemId, customerId: $customerId, unit: $unit, item: $item)';
  }

  @override
  bool operator ==(covariant NewCheckedList other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.quantity == quantity &&
        other.itemId == itemId &&
        other.customerId == customerId &&
        other.unit == unit &&
        other.item == item;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        quantity.hashCode ^
        itemId.hashCode ^
        customerId.hashCode ^
        unit.hashCode ^
        item.hashCode;
  }

  @override
  fromJsonBase(String source) {
    return NewCheckedList.fromJson(source);
  }

  @override
  String toJsonBase() {
    return toJson();
  }
}
