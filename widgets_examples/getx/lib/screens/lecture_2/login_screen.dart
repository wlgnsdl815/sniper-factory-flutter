import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx/controller/global_data_controller_2.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<GlobalDataController2>();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.user.value = null;
        },
        label: Text('로그아웃'),
      ),
      body: Center(
        child: Text(
          '로그인 되었습니다.',
        ),
      ),
    );
  }
}
