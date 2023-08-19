import 'package:day33/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController idController =
      TextEditingController(text: 'test2@kkk.kkk');
  TextEditingController pwController = TextEditingController(text: 'qwer12345');

  RxBool _isChecked = false.obs;

  get isChecked => _isChecked.value;

  var authController = Get.find<AuthController>();
  login(String id, String pw) {
    authController.login(id, pw);
  }

  onCheckBoxPressed() {
    _isChecked.value = !_isChecked.value;
    print(_isChecked.value);
  }
}
