import 'package:get_it/get_it.dart';

import '../constant/service_path_constant.dart';
import '../constant/svg_path_constant.dart';
import '../theme/dark_theme.dart';
import '../theme/ligt_theme.dart';

GetIt getIt = GetIt.I;

class DependecyService {
  static void setup() {
    getIt.registerLazySingleton<LightTheme>(() => LightTheme());
    getIt.registerLazySingleton<DarkTheme>(() => DarkTheme());
    getIt.registerLazySingleton<ConstantServicePath>(
        () => ConstantServicePath());
    getIt.registerLazySingleton<ConstantSvgPath>(() => ConstantSvgPath());
  }
}
