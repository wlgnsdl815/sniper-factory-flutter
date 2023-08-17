import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/app_global_data_controller.dart';

class MemoScreen extends StatelessWidget {
  const MemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<AppGlobalDataController>(tag: 'My Secret Controller');
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: controller.memos.length,
          itemBuilder: ((context, index) => ListTile(
                title: Text(controller.memos[index]),
              )),
        ),
      ),
    );
  }
}
