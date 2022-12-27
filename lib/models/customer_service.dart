import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../core/service/dependecy_service.dart';
import 'customer_model.dart';
import 'user_session.dart';

part 'customer_service.g.dart';

class CustomerMobx = _CustomerMobxBase with _$CustomerMobx;

abstract class _CustomerMobxBase with Store {
  @observable
  List<CustomerModel> customers = [];

  @observable
  String infoMessage = '';

  @action
  void refreshState() {
    customers = customers;
  }

  @action
  Future<void> customerPostData({
    required String customerCompanyName,
    required String authorityName,
    required String customerEmail,
    required String customerPhone,
    required String taxPlace,
    required String taxNo,
    required String adress,
  }) async {
    var url = Uri.http('envanter.sgktesvikrehberi.com', 'Api/NewMusteri');
    final response = await http.post(url, body: {
      'musteri_firma_adi': customerCompanyName,
      'musteri_yetkili': authorityName,
      'musteri_email': customerEmail,
      'musteri_telefon': customerPhone,
      'musteri_vergi_daire': taxPlace,
      'musteri_vergi_no': taxNo,
      'musteri_adres': adress
    }, headers: {
      'cookie': getIt.get<UserSession>().sessionId
    });
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      infoMessage = response.body;
    } else {}
  }

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
