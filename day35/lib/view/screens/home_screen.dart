import 'package:day35/controllers/auth_controller.dart';
import 'package:day35/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<AuthController> {
  const HomeScreen({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<LoginController>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('data'),
            ElevatedButton(
              onPressed: authController.logout,
              child: Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
