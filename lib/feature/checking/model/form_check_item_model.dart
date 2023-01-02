// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemCheckForm {
  final String CustomerId;
  final double quantity;
  final String itemId;
  ItemCheckForm({
    required this.CustomerId,
    required this.quantity,
    required this.itemId,
  });

  ItemCheckForm copyWith({
    String? CustomerId,
    double? quantity,
    String? itemId,
  }) {
    return ItemCheckForm(
      CustomerId: CustomerId ?? this.CustomerId,
      quantity: quantity ?? this.quantity,
      itemId: itemId ?? this.itemId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CustomerId': CustomerId,
      'quantity': quantity,
      'itemId': itemId,
    };
  }

  factory ItemCheckForm.fromMap(Map<String, dynamic> map) {
    return ItemCheckForm(
      CustomerId: map['CustomerId'] as String,
      quantity: map['quantity'] as double,
      itemId: map['itemId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemCheckForm.fromJson(String source) => ItemCheckForm.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ItemCheckForm(CustomerId: $CustomerId, quantity: $quantity, itemId: $itemId)';

  @override
  bool operator ==(covariant ItemCheckForm other) {
    if (identical(this, other)) return true;
  
    return 
      other.CustomerId == CustomerId &&
      other.quantity == quantity &&
      other.itemId == itemId;
  }

  @override
  int get hashCode => CustomerId.hashCode ^ quantity.hashCode ^ itemId.hashCode;
}
