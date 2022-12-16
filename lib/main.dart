import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:aden_envanterus/core/route/router_generator.dart';
import 'package:aden_envanterus/core/theme/dark_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'core/service/dependecy_service.dart';
import 'core/theme/ligt_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  DependecyService.setup();
  runApp(MyApp(
    mode: savedThemeMode,
  ));
}


class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? mode;
  const MyApp({super.key, this.mode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: getIt.get<LightTheme>().lightTheme,
      initial: mode ?? AdaptiveThemeMode.dark,
      dark: getIt.get<DarkTheme>().darkTheme,
      builder: (light, dark) {
        return MaterialApp.router(
          theme: light,
          routeInformationParser: getIt.get<AppRouter>().defaultRouteParser(),
          routerDelegate: getIt.get<AppRouter>().delegate(),
          darkTheme: dark,
          debugShowCheckedModeBanner: false,
          title: 'Envanterus',
        );
      },
    );
  }
}
