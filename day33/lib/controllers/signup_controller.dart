import 'package:day33/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pw2Controller = TextEditingController();
  TextEditingController nameController = TextEditingController();

  signUp(String email, String pw, String pw2, String name) {
    UserService().postSignup(
      emailController.text,
      pwController.text,
      pw2Controller.text,
      nameController.text,
    );
  }
}
