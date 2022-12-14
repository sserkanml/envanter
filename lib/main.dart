import 'package:adaptive_theme/adaptive_theme.dart';
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
      initial: mode ?? AdaptiveThemeMode.light,
      builder: (light, dark) {
        return MaterialApp.router(
          theme: light,
          darkTheme: dark,
          debugShowCheckedModeBanner: false,
          title: 'Envanterus',
        );
      },
    );
  }
}
