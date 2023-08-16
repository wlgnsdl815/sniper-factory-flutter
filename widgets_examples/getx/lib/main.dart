import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/global_data_controller.dart';
import 'package:getx/controller/global_data_controller_2.dart';
import 'package:getx/screens/lecture_2/home_screen.dart';
import 'package:getx/utils/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GlobalDataController());
    Get.put(GlobalDataController2());
    return GetMaterialApp(
      getPages: AppPages.pages,
      theme: ThemeData.dark(useMaterial3: true),
      home: HomeScreen(),
    );
  }
}
