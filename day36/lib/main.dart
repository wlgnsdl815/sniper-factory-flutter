// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:day36/controllers/home_controller.dart';
import 'package:day36/utils/get_screens.dart';
import 'package:day36/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
      getPages: GetScreens.screens,
      home: HomeScreen(),
    );
  }
}
