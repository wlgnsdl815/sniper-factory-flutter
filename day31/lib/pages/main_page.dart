import 'package:day31/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  AppRoutes.detail,
                  parameters: {'a': '3'},
                  arguments: 'Hello World!',
                );
              },
              child: Text('Go to Detail Page'),
            ),
          ],
        ),
      ),
    );
  }
}
