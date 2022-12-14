import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:aden_envanterus/core/service/shared_references.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/constant/cameras_constant.dart';
import 'core/route/router_generator.dart';
import 'core/service/dependecy_service.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/ligt_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  DependecyService.setup();
  await getIt.get<Shared>().getRef();
  try {
    cameras = await availableCameras();
  } catch (e) {
    print(e);
  }

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
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          supportedLocales: const [Locale('tr', '')],
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
