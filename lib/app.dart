import 'package:flutter/material.dart';
import 'package:masrofy/features/splash/splash_screen.dart';

class MasrofyApp extends StatelessWidget {
  const MasrofyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
