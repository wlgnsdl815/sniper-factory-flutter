import 'package:day29/controllers/app_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettingController appSettingController =
        Get.find<AppSettingController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(appSettingController.appName),
          ],
        ),
      ),
    );
  }
}
