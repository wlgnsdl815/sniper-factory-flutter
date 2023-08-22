// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:day35/controllers/auth_controller.dart';
import 'package:day35/controllers/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<AuthController> {
  const HomeScreen({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    var loginController = Get.find<LoginController>();

    var userEmail = FirebaseAuth.instance.currentUser!.email;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userEmail!),
            controller.checkEmailVerification()
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.verified,
                        color: Colors.green,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '인증된 사용자입니다',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  )
                : TextButton(
                    onPressed: () {},
                    child: Text(
                      '이곳을 눌러 이메일 인증을 해주세요.',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
            ElevatedButton(
              onPressed: loginController.logout,
              child: Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
