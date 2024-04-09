import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/contants/colors.dart';
import 'package:food_app/locator.dart';
import 'package:food_app/screens/detail_screen.dart';
import 'package:food_app/screens/on_boarding_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:food_app/widgets/glass_container_widget.dart';
import 'package:food_app/widgets/iconTextWidget.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: const OnBoardingScreen(),
    );
  }
}
