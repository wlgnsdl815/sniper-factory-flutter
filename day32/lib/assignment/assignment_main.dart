import 'package:day32/assignment/controllers/login_controller.dart';
import 'package:day32/assignment/services/user_service.dart';
import 'package:day32/assignment/utils/app_routes.dart';
import 'package:day32/assignment/utils/app_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    UserService().getData('Teddy', 'sfac12341234');
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      }),
      getPages: AppScreens.screens,
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              Get.toNamed(AppRoutes.login);
            },
            child: Text('Go to Login Screen'),
          ),
        ),
      ),
    );
  }
}
