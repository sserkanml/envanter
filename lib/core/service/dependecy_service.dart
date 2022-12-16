import 'package:aden_envanterus/core/route/router_generator.dart';
import 'package:aden_envanterus/core/service/shared_references.dart';
import 'package:aden_envanterus/feature/authentication/view_model/get_login.dart';
import 'package:aden_envanterus/models/member_service.dart';
import 'package:aden_envanterus/models/projects_service.dart';
import 'package:aden_envanterus/models/user_session.dart';
import 'package:get_it/get_it.dart';

import '../constant/service_path_constant.dart';
import '../constant/svg_path_constant.dart';
import '../theme/dark_theme.dart';
import '../theme/ligt_theme.dart';

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
    getIt.registerSingleton<ProjectsMobx>(ProjectsMobx());
    getIt.registerSingleton<UserSession>(UserSession());
    await getIt.get<Shared>().getRef();
  }
}
