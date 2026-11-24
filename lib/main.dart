import 'package:flutter/material.dart';
import 'login.dart';

final ValueNotifier<ThemeMode> appTheme = ValueNotifier(ThemeMode.light);

void main() => runApp(const SisterApp());

class SisterApp extends StatelessWidget {
  const SisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: appTheme,
      builder: (_, mode, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SISTER SKANSIKA',
        themeMode: mode,
        theme: _theme(Brightness.light),
        darkTheme: _theme(Brightness.dark),
        home: const LoginPage(),
      ),
    );
  }

  ThemeData _theme(Brightness brightness) {
    const accent = Color(0xFFF97316);
    final dark = brightness == Brightness.dark;
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: dark ? const Color(0xFF0B0F14) : Colors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accent,
        brightness: brightness,
        primary: accent,
        surface: dark ? const Color(0xFF0B0F14) : Colors.white,
      ),
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      dividerColor: dark ? const Color(0xFF232B36) : const Color(0xFFE5E7EB),
      inputDecorationTheme: const InputDecorationTheme(
        border: UnderlineInputBorder(),
      ),
    );
  }
}
