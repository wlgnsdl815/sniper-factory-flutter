import 'package:day35/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController idController2 = TextEditingController();
  TextEditingController pwController2 = TextEditingController();
  var authController = Get.find<AuthController>();

  login() async {
    authController.handleLogin(idController.text, pwController.text);
  }

  signUp() async {
    authController.handleSignUp(idController2.text, pwController2.text);
  }

  logout() {
    authController.handelLogout();
  }
}
