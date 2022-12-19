import 'dart:convert';

import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/models/checks_detail_model.dart';
import 'package:aden_envanterus/models/checks_model.dart';
import 'package:aden_envanterus/models/user_session.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'checks_service.g.dart';

class CheckMobx = _CheckMobxBase with _$CheckMobx;

abstract class _CheckMobxBase with Store {
  @observable
  List<CheckModel> checks = [];
 

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
