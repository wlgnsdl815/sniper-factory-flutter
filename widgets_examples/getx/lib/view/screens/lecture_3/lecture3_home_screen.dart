import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home_controller.dart';
import 'package:getx/view/widget/app_logo.dart';

class HomeScreen3 extends GetView<HomeController> {
  const HomeScreen3({super.key});

  static const String route = '/home3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(),
            Text('Home Screen ^0^'),
            TextButton(
              onPressed: () {
                controller.toLogin();
              },
              child: Text('로그인으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
