import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

import '../core/service/dependecy_service.dart';
import 'projets_model.dart';
import 'user_session.dart';

part 'projects_service.g.dart';

class ProjectsMobx = _ProjectsMobxBase with _$ProjectsMobx;

abstract class _ProjectsMobxBase with Store {
  @observable
  List<ProjectsModel> projects = [];
  @observable
  String result = '';

  @observable
  String infoMessage = '';

  @observable
  void refreshState() {
    projects = projects;
  }

  @action
  Future<void> postProject(
      {required String projectName,
      required String note,
      required String tag,
       File? image,
      required String projectUserId}) async {
    var url = Uri.http(
      'envanter.sgktesvikrehberi.com',
      'Api/NewProje',
    );
    var request = http.MultipartRequest("POST", url);
    request.headers['cookie'] = getIt.get<UserSession>().sessionId;
    request.fields["Proje_Adi"] = projectName;
    request.fields["Etiket"] = tag;
    request.fields["Proje_Not"] = note;
    request.fields["FirmaKullaniciID"] = projectUserId;
   if (image==null) {
     
   } else {
      request.files.add(http.MultipartFile.fromBytes(
        "PostedFile", File(image.path).readAsBytesSync(),
        filename: image.path));
   }
   final response = await request.send();
    // final response = await http.post(url, body: {
    //   'Proje_Adi': projectName,
    //   'Etiket': tag,
    //   'Proje_Not': note,
    //   'FirmaKullaniciID': projectUserId
    // }, headers: {
    //   'cookie': getIt.get<UserSession>().sessionId
    // });
    if (response.statusCode >= 200 && response.statusCode <= 299) {
    
      await getAllProjects();
    } else {
      infoMessage = '';
    }
  }

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
