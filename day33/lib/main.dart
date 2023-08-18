import 'package:day33/styles/colors.dart';
import 'package:day33/utils/app_screens.dart';
import 'package:day33/utils/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppScreens.screens,
      theme: ThemeData(
        fontFamily: 'Neo',
        scaffoldBackgroundColor: backgroundColor,
      ),
      initialRoute: ScreenRoutes.login,
    );
  }
}
