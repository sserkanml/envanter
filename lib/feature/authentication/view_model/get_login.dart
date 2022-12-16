import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/models/user_session.dart';
import 'package:http/http.dart' as http;

class AuthenticateUser {
  String email = '';
  String password = '';
  Future<String> authenticaceUser(
      {required String email, required String pasword}) async {
    var url = Uri.http('envanter.sgktesvikrehberi.com', 'Api/LoginUye');

    final response =
        await http.post(url, body: {'_UserName': email, '_Password': pasword});

    getIt.get<UserSession>().sessionId = response.headers['set-cookie'] ?? '';
    print(response.headers['set-cookie']);
    return response.body;
  }
}
