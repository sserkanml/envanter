import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/feature/dashboard/model/get_assigned_project.dart';
import 'package:aden_envanterus/models/user_session.dart';
import 'package:http/http.dart' as http;

import '../../../models/check_detail_service.dart';
import '../../../models/checks_service.dart';
import '../../../models/customer_service.dart';
import '../../../models/items_service.dart';
import '../../../models/member_service.dart';
import '../../../models/projects_service.dart';

class AuthenticateUser {
  String email = '';
  String password = '';
  Future<String> authenticaceUser(
      {required String email, required String pasword}) async {
    var url = Uri.http('envanter.sgktesvikrehberi.com', 'Api/LoginUye');

    final response =
        await http.post(url, body: {'_UserName': email, '_Password': pasword});

    getIt.get<UserSession>().sessionId = response.headers['set-cookie'] ?? '';

    return response.body;
  }

  static Future<void> getAllData() async {
    await getIt.get<ProjectsMobx>().getAllProjects();
    await getIt.get<MemberMobx>().getAllMembers();
    await getIt.get<ItemsMobx>().getAllItems();
    await getIt.get<CheckDetailMobx>().getAllChekcDetail();
    await getIt.get<CheckMobx>().getAllChecks();
    await getIt.get<CustomerMobx>().getAllCustomers();
    await getIt.get<GetAssignedProjectMobx>().getAllAssignedProjects();
  }
}
