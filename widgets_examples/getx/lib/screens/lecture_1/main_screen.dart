import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/app_global_data_controller.dart';
import 'package:getx/screens/lecture_1/memo_screen.dart';
import 'package:getx/screens/lecture_1/user_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(
      AppGlobalDataController(
        name: 'Jihoon',
        age: 99,
        memos: [],
      ),
      tag: 'My Secret Controller',
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${controller.name}님 / ${controller.age}살'),
            TextButton(
              onPressed: () {
                Get.to(() => MemoScreen());
              },
              child: Text('To Memo Screen'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => UserScreen());
              },
              child: Text('To User Screen'),
            ),
            TextButton(
              onPressed: () {
                controller.memos.add('새로운 메모가 들어갑니다');
              },
              child: Text('Add memo'),
            ),
          ],
        ),
      ),
    );
  }
}
