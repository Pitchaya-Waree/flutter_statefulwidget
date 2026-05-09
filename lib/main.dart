// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_statefulwidget/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

// Define MyApp as the root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // This widget wraps your MaterialApp
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}