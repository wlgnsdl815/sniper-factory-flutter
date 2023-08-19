import 'package:day33/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pw2Controller = TextEditingController();
  TextEditingController nameController = TextEditingController();

  signUp({
    required String email,
    required String pw,
    required String pw2,
    String? name,
  }) async {
    await UserService().postSignup(
      email: emailController.text,
      pw: pwController.text,
      pw2: pw2Controller.text,
      name: nameController.text,
    );
  }
}
