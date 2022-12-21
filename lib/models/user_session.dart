import 'package:mobx/mobx.dart';

part 'user_session.g.dart';

class UserSession = _UserSessionBase with _$UserSession;

abstract class _UserSessionBase with Store {
  @observable
  String sessionId = '';

  @action
  void getId({required String id}) {
    sessionId = id;
  }
}
