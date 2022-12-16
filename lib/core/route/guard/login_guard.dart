import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/service/shared_references.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
 
    if (getIt.get<Shared>().pref.getBool('isLogin') ?? false) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      getIt.get<Shared>().pref.setBool('isLogin', false);
    
      resolver.next(true);
    }
  }
}
