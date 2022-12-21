import 'package:auto_route/auto_route.dart';

import '../../service/dependecy_service.dart';
import '../../service/shared_references.dart';


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
