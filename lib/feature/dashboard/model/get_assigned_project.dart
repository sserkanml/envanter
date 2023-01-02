import 'dart:convert';

import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/models/projets_model.dart';
import 'package:aden_envanterus/models/user_session.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'get_assigned_project.g.dart';

class GetAssignedProjectMobx = _GetAssignedProjectMobxBase
    with _$GetAssignedProjectMobx;

abstract class _GetAssignedProjectMobxBase with Store {
  @observable
  List<ProjectsModel> projects = [];

  @action
  Future<void> getAllAssignedProjects() async {
    final url =
        Uri.http('envanter.sgktesvikrehberi.com', 'Api/GetBanaAtananProjeler');
    final response = await http
        .get(url, headers: {'cookie': getIt.get<UserSession>().sessionId});

    if (response.statusCode >= 200 || response.statusCode <= 299) {
      final result = jsonDecode(response.body);
      projects = result
          .map<ProjectsModel>((element) => ProjectsModel.fromMap(element))
          .toList();
    } else {}
  }
}
