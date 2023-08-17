import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/global_data_controller.dart';
import 'package:getx/controller/global_data_controller_2.dart';
import 'package:getx/controller/home_controller.dart';
import 'package:getx/controller/login_controller.dart';
import 'package:getx/view/screens/lecture_3/lecture3_home_screen.dart';
import 'package:getx/utils/routes.dart';

import 'package:getx/utils/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(GlobalDataController());
        Get.put(GlobalDataController2());
        Get.put(LoginController());
        // Get.lazyPut(() => LoginController());
        // Get.lazyPut(() => HomeController());
        Get.put(HomeController());
      }),
      getPages: AppPages.pages,
      theme: ThemeData.dark(useMaterial3: true),
      home: HomeScreen3(),
    );
  }
}
