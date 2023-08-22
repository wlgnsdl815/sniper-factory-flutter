// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:day35/controllers/auth_controller.dart';
import 'package:day35/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.idController,
                  decoration: InputDecoration(
                    hintText: 'Email을 입력하세요',
                  ),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller.pwController,
                  decoration: InputDecoration(
                    hintText: 'PW를 입력하세요',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.login,
              child: Text('로그인'),
            ),
            IconButton(
              onPressed: authController.signInWithGoogle,
              icon: Icon(
                Icons.g_mobiledata,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            '이메일로 회원가입',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 30),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: controller.idController2,
                                decoration: InputDecoration(
                                  hintText: 'Email을 입력하세요',
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: controller.pwController2,
                                decoration: InputDecoration(
                                  hintText: 'PW를 입력하세요',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          ElevatedButton(
                            onPressed: () {
                              controller.signUp();
                              Get.back();
                            },
                            child: Text('완료'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Text('회원가입'),
            ),
            TextButton(
              onPressed: controller.logout,
              child: Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
