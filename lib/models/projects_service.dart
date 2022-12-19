import 'dart:convert';

import 'package:aden_envanterus/models/projets_model.dart';
import 'package:aden_envanterus/models/user_session.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import '../core/service/dependecy_service.dart';
part 'projects_service.g.dart';

class ProjectsMobx = _ProjectsMobxBase with _$ProjectsMobx;

abstract class _ProjectsMobxBase with Store {
  @observable
  List<ProjectsModel> projects = [];
  @observable
  String result = '';

  @action
  Future<void> getAllProjects() async {
    var url = Uri.http(
      'envanter.sgktesvikrehberi.com',
      'Api/GetProjeler',
    );
    var response = await http
        .get(url, headers: {'cookie': getIt.get<UserSession>().sessionId});

    if (response.statusCode <= 299 && response.statusCode >= 200) {
      final result = jsonDecode(response.body);
      projects = result['jsonData_2'].map<ProjectsModel>((element) {
        return ProjectsModel.fromMap(element);
      }).toList();
    } else {}
    result = response.body;
  }
}
