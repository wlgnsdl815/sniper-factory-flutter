import 'package:day33/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController idController =
      TextEditingController(text: 'test2@kkk.kkk');
  TextEditingController pwController = TextEditingController(text: 'qwer12345');

  RxBool _checked = false.obs;

  get value => _checked.value;

  setValue() {}

  var authController = Get.find<AuthController>();
  login(String id, String pw) {
    authController.login(id, pw);
    // Get.find<AuthController>().login(id, pw);
  }

  onCheckBoxPressed() {
    _checked.value = !_checked.value;
  }
}
