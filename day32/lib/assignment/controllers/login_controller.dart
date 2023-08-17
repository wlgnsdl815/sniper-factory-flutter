import 'package:day32/assignment/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController idController = TextEditingController(text: 'Teddy');
  TextEditingController pwController =
      TextEditingController(text: 'sfac12341234');

  login() {
    Get.find<AuthController>().login(idController.text, pwController.text);
  }
}
