import 'dart:convert';

import 'package:aden_envanterus/models/check_detail_service.dart';

import '../core/service/dependecy_service.dart';
import 'checks_model.dart';
import 'user_session.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'checks_service.g.dart';

class CheckMobx = _CheckMobxBase with _$CheckMobx;

abstract class _CheckMobxBase with Store {
  @observable
  List<CheckModel> checks = [];

  @observable
  String infoMessage = '';

  @action
  Future<void> createCheck(
      {required String item_id,
      required String quantity,
      required String customer_id}) async {
    final url = Uri.http('envanter.sgktesvikrehberi.com', 'Api/SayimKaydet');
    final response = await http.post(url, body: {
      'Malzeme': item_id,
      'Miktar': quantity,
      'Musteri_ID': customer_id
    }, headers: {
      'cookie': getIt.get<UserSession>().sessionId
    });
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      infoMessage = response.body;
      await getAllChecks();
      await getIt.get<CheckDetailMobx>().getAllChekcDetail();
    } else {
      print(response.body);
    }
  }

  @action
  Future<void> getAllChecks() async {
    final url = Uri.http('envanter.sgktesvikrehberi.com', 'Api/GetSayimlar');
    final response = await http
        .get(url, headers: {'cookie': getIt.get<UserSession>().sessionId});
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      final result = jsonDecode(response.body);
      checks = result['jsonData_1'].map<CheckModel>((element) {
        return CheckModel.fromMap(element);
      }).toList();
    } else {}
  }
}
