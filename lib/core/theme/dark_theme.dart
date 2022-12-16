import 'package:flutter/material.dart';

class DarkTheme {
  ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF424242),
          iconTheme: IconThemeData(
            color: Color(0xFFFFFBFE),
            size: 25,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: const Color(0xFFD32F2F),
        selectedLabelStyle: const TextStyle(
          color: Color(0xFFD32F2F),
        ),
  
        unselectedIconTheme: IconThemeData(color: Colors.white.withOpacity(.2)),
      ),
      iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
      primaryColor: const Color(0xFF212121),
      primaryColorDark: const Color(0xFF212121),
      brightness: Brightness.dark,
      primaryColorLight: const Color(0xFF9E9E9E),
      secondaryHeaderColor: const Color(0xFF616161),
      toggleableActiveColor: const Color(0xFF64FFDA),
      bottomAppBarColor: const Color(0xFF424242),
      errorColor: const Color(0xFFD32F2F),
      canvasColor: const Color(0xFF303030),
      cardColor: const Color(0xFF424242),
      scaffoldBackgroundColor: const Color(0xFF303030),
      dialogBackgroundColor: const Color(0xFF424242),
      indicatorColor: const Color(0xFF64FFDA),
      dividerColor: const Color(0x1FFFFFFF),
      disabledColor: const Color(0x62FFFFFF),
      hoverColor: const Color(0x0AFFFFFF),
      focusColor: const Color(0x1FFFFFFF),
      highlightColor: const Color(0x40CCCCCC),
      splashColor: const Color(0x40CCCCCC),
      shadowColor: const Color(0xFF000000),
      hintColor: const Color(0x99FFFFFF),
      selectedRowColor: const Color(0xFFF5F5F5),
      unselectedWidgetColor: const Color(0xB3FFFFFF),
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFFDFE0FF),
          onPrimary: Color(0xFF000743),
          secondary: Color(0xFF9575CD),
          onSecondary: Color(0xFFFFFFFF),
          onSecondaryContainer: Color(0xFFFFFFFF),
          outline: Color(0xFFC7C5CD),
          secondaryContainer: Color(0xFF502CA7),
          primaryContainer: Color(0xFF2639AB),
          onPrimaryContainer: Color(0xFFFBF8FF),
          shadow: Color(0xFF000000),
          tertiary: Color(0xFFFFECF5),
          onTertiary: Color(0xFF270022),
          surfaceTint: Color(0xFFDFE0FF),
          inverseSurface: Color(0xFFE5E1E5),
          tertiaryContainer: Color(0xFF801272),
          onTertiaryContainer: Color(0xFFFFF7F9),
          onInverseSurface: Color(0xFF1B1B1E),
          error: Color(0xFFFFB4AB),
          surfaceVariant: Color(0xFF303036),
          inversePrimary: Color(0xFF4153C4),
          onSurfaceVariant: Color(0xFFF2EFF7),
          onError: Color(0xFF2D0001),
          onErrorContainer: Color(0xFFFFF8F7),
          background: Color(0xFF111113),
          errorContainer: Color(0xFF93000A),
          onBackground: Color(0xFFFFFBFE),
          surface: Color(0xFF111113),
          onSurface: Color(0xFFFFFBFE)));
}
