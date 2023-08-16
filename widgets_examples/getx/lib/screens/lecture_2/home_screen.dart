import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/global_data_controller.dart';
import 'package:getx/controller/global_data_controller_2.dart';
import 'package:getx/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<GlobalDataController>();
    var controller2 = Get.find<GlobalDataController2>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(controller.myLevel.value.toString()),
            ),
            Obx(
              () => Text(controller.myName.value),
            ),
            ElevatedButton(
              onPressed: () {
                controller.myLevel(controller.myLevel.value += 1);
              },
              child: Text('+1'),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.myName.value == 'Jihoon') {
                  controller.myName('JihoonGod');
                } else
                  controller.myName('Jihoon');
              },
              child: Text('이름 변경'),
            ),
            TextButton(
              onPressed: () {
                print(controller2.user);
                controller2.user(User(id: 'id', nickname: 'Jihoon'));
              },
              child: Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }
}
