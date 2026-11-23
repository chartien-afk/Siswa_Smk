
import 'package:flutter/material.dart';
import 'auth/login.dart';

void main() {
  runApp(const SisterApp());
}

class SisterApp extends StatelessWidget {
  const SisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SISTER Skansika',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F8Fa),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF47732),
        ),
      ),
      home: const LoginPage(),
    );
  }
}