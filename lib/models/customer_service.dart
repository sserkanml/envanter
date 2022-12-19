import 'dart:convert';

import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/models/customer_model.dart';
import 'package:aden_envanterus/models/user_session.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'customer_service.g.dart';

class CustomerMobx = _CustomerMobxBase with _$CustomerMobx;

abstract class _CustomerMobxBase with Store {
  @observable
  List<CustomerModel> customers = [];

  @action
  Future<void> getAllCustomers() async {
    final url = Uri.http('envanter.sgktesvikrehberi.com', 'Api/GetMusteriler');
    final response = await http
        .get(url, headers: {'cookie': getIt.get<UserSession>().sessionId});

    if (response.statusCode <= 299 && response.statusCode >= 200) {
      final result = jsonDecode(response.body);
      customers = result.map<CustomerModel>((element) {
        return CustomerModel.fromMap(element);
      }).toList();
    } else {}
  }
}
