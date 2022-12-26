import 'dart:convert';

import 'package:aden_envanterus/models/user_session.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import '../core/service/dependecy_service.dart';
import 'checks_detail_model.dart';
part 'check_detail_service.g.dart';

class CheckDetailMobx = _CheckDetailMobxBase with _$CheckDetailMobx;

abstract class _CheckDetailMobxBase with Store {
  @observable
  List<CheckDetailModel> checksDetail = [];

  @action
  Future<void> getAllChekcDetail() async {
    final url = Uri.http('envanter.sgktesvikrehberi.com', 'Api/GetSayimlar');
    final response = await http
        .get(url, headers: {'cookie': getIt.get<UserSession>().sessionId});

    if (response.statusCode <= 299 && response.statusCode >= 200) {
      final result = jsonDecode(response.body);

      checksDetail = result['jsonData_3'].map<CheckDetailModel>((element) {
        return CheckDetailModel.fromMap(element);
      }).toList();
      print(checksDetail.length);
    } else {}
  }
}
