// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.dialog(
                  Dialog(
                    child: Container(
                      height: Get.height / 2,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get.dialog 안에는\nDialog 위젯이나\nAlertDialog 위젯을 사용해야합니다.',
                            style: TextStyle(fontSize: 30.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Text('Get Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.0)),
                    height: Get.height / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Get의 바텀시트입니다.'),
                      ],
                    ),
                  ),
                );
              },
              child: Text('Get BottomSheet'),
            ),
            ElevatedButton(
              onPressed: () {
                // 제목과 내용을 넣어주면 된다.
                Get.snackbar('스낵바 제목입니다.', '스낵바 내용입니다.');
              },
              child: Text('Get Snackbar'),
            ),
          ],
        ),
      ),
    );
  }
}
