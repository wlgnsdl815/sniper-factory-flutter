// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.snackbar('내용표시', '현재 디바이스 사이즈입니다.${Get.width},${Get.height}');
        },
        label: Text('스낵바 출력'),
      ),
      body: Center(
        child: Text('Second Screen'),
      ),
    );
  }
}
