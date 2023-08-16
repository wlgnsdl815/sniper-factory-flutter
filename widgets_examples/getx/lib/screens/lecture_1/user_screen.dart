import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/app_global_data_controller.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =
        Get.find<AppGlobalDataController>(tag: 'My Secret Controller');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.name),
            Text(controller.age.toString()),
            Text('현재 메모 수: ${controller.memos.length}'),
          ],
        ),
      ),
    );
  }
}
