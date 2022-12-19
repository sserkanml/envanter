import 'dart:convert';
import 'dart:math';

import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/models/items_model.dart';

import 'package:aden_envanterus/models/user_session.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'items_service.g.dart';

class ItemsMobx = _ItemsMobxBase with _$ItemsMobx;

abstract class _ItemsMobxBase with Store {
  @observable
  List<ItemsModel> items = [];

  @action
  Future<void> getAllItems() async {
    final url = Uri.http('envanter.sgktesvikrehberi.com', 'Api/GetMalzemeler');

    final response = await http
        .get(url, headers: {'cookie': getIt.get<UserSession>().sessionId});

    if (response.statusCode <= 299 && response.statusCode >= 200) {
      final result = jsonDecode(response.body);
      items = result['jsonData_1'].map<ItemsModel>((element) {
        return ItemsModel.fromMap(element);
      }).toList();
    } else {
      print(response.body);
    }
  }
}
