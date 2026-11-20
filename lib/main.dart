
import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyGlobeApp());
}

class MyGlobeApp extends StatelessWidget {
  const MyGlobeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Globe',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      home: const SplashScreen(),
    );
  }
}
