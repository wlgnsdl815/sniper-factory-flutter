import 'package:day32/assignment/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.idController,
            ),
            TextField(
              controller: controller.pwController,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                controller.login();
              },
              child: Text('로그인하기'),
            ),
          ],
        ),
      ),
    );
  }
}
