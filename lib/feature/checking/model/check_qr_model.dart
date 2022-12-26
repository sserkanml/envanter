import 'package:flutter/widgets.dart';

import '../../../models/items_model.dart';

class CheckQrModel {
  final String name;
   double quantity;
  final ItemsModel item; 
  final TextEditingController controller;

  CheckQrModel( {required this.controller, required this.item,required this.name,required this.quantity});
}
