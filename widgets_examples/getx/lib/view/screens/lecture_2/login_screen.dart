// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    // var globalController = Get.find<GlobalDataController2>();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // globalController.user.value = null;
        },
        label: Text('로그아웃'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 94.0,
              ),
              Text(
                '비밀듣는 고양이',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: controller.idController,
                decoration: InputDecoration(hintText: 'ID'),
              ),
              TextField(
                controller: controller.pwController,
                decoration: InputDecoration(hintText: 'PW'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: controller.login,
                child: Text('로그인하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
