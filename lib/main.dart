import 'package:build_app/constants/theme.dart';
import 'package:build_app/screens/sub_page/splash.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      // title: 'Spotify',
      home: const SplashPage()
    );
  }
}