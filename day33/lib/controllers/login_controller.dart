import 'package:day33/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController idController =
      TextEditingController(text: 'test2@kkk.kkk');
  TextEditingController pwController = TextEditingController(text: 'qwer12345');

  login(String id, String pw) {
    Get.find<AuthController>().login(id, pw);
  }
}
