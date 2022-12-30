import 'package:get_it/get_it.dart';

import '../../feature/authentication/view_model/get_login.dart';
import '../../models/check_detail_service.dart';
import '../../models/checks_service.dart';
import '../../models/customer_service.dart';
import '../../models/items_service.dart';
import '../../models/member_service.dart';
import '../../models/projects_service.dart';
import '../../models/user_session.dart';
import '../constant/info_devices.dart';
import '../constant/service_path_constant.dart';
import '../constant/svg_path_constant.dart';
import '../route/router_generator.dart';
import '../theme/dark_theme.dart';
import '../theme/ligt_theme.dart';
import 'shared_references.dart';

GetIt getIt = GetIt.I;

class DependecyService {
  static void setup() async {
    getIt.registerLazySingleton<LightTheme>(() => LightTheme());
    getIt.registerLazySingleton<DarkTheme>(() => DarkTheme());
    getIt.registerLazySingleton<AppRouter>(() => AppRouter());
    getIt.registerSingleton<AuthenticateUser>(AuthenticateUser());

    getIt.registerLazySingleton<ConstantServicePath>(
        () => ConstantServicePath());
    getIt.registerLazySingleton<ConstantSvgPath>(() => ConstantSvgPath());
    getIt.registerSingleton<Shared>(Shared());
    getIt.registerSingleton<MemberMobx>(MemberMobx());
    getIt.registerSingleton<CustomerMobx>(CustomerMobx());
    getIt.registerSingleton<CheckMobx>(CheckMobx());
    getIt.registerSingleton<ProjectsMobx>(ProjectsMobx());
    getIt.registerSingleton<CheckDetailMobx>(CheckDetailMobx());
    getIt.registerSingleton<ItemsMobx>(ItemsMobx());
    getIt.registerSingleton<UserSession>(UserSession());
    getIt.registerSingleton<InfoDevices>(InfoDevices());
    await getIt.get<Shared>().getRef();
    if (getIt.get<Shared>().pref.containsKey('isFirstUsage')) {
       getIt.get<Shared>().pref.setBool('isFirstUsage', false);
    } else {
      getIt.get<Shared>().pref.setBool('isFirstUsage', true);
    }
  }
}
