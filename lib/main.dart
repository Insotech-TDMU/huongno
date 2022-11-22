
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:huongno/constant/app_info.dart';
import 'package:huongno/screen/login_page.dart';

import 'constant/app_secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await AppStorage.getUserToken();
  await AppInfo.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}