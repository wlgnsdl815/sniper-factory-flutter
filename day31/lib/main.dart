// ignore_for_file: prefer_const_constructors
import 'package:day31/pages/main_page.dart';
import 'package:day31/utils/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.appPages,
      home: MainPage(),
    );
  }
}
