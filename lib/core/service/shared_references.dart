import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  late SharedPreferences pref;
  Future<void> getRef() async {
    pref = await SharedPreferences.getInstance();
    return;
  }
}
