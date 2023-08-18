import 'package:day33/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  login(String id, String pw) {
    Get.find<AuthController>().login(id, pw);
  }
}
