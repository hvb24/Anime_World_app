import 'package:anime_world/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:anime_world/screens/splash_screen.dart'; // Import the SplashScreen

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Start with the SplashScreen
    );
  }
}
