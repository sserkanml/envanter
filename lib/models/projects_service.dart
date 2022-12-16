import 'package:aden_envanterus/feature/projects/model/projects_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import '../core/service/dependecy_service.dart';
import '../core/service/shared_references.dart';
part 'projects_service.g.dart';

class ProjectsMobx = _ProjectsMobxBase with _$ProjectsMobx;

abstract class _ProjectsMobxBase with Store {
  @observable
  List<ProjectsModel> projects = [];
  @observable
  String result = '';

  @action
  Future<void> getAllProjects() async {
    var url = Uri.http('envanter.sgktesvikrehberi.com', 'Api/GetProjeler',
        {'firmaID': getIt.get<Shared>().pref.getString('sessionID')});
    var response = await http.get(url, headers: {
      'cookie': getIt.get<Shared>().pref.getString('sessionID') ?? ''
    });
    result = response.body;
  }
}
