// ignore_for_file: prefer_const_constructors
import 'package:day32/lecture/controllers/auth_controller.dart';
import 'package:day32/lecture/controllers/login_controller.dart';
import 'package:day32/lecture/controllers/main_controller.dart';
import 'package:day32/lecture/view/lgoin_page.dart';
import 'package:day32/lecture/view/main_page.dart';
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
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController());
        Get.put(MainController());
      }),
      getPages: [
        GetPage(name: LoginPage.route, page: () => LoginPage()),
        GetPage(name: MainPage.route, page: () => MainPage()),
      ],
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              Get.toNamed(LoginPage.route);
            },
            child: Text('data'),
          ),
        ),
      ),
    );
  }
}
