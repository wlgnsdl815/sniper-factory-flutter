import 'package:day33/controllers/login_controller.dart';
import 'package:day33/styles/text_styles.dart';
import 'package:day33/utils/screen_routes.dart';
import 'package:day33/widget/cat_circle_avatar.dart';
import 'package:day33/widget/custom_elevated_button.dart';
import 'package:day33/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '로그인',
                  style: CustomTextStyle.title,
                ),
                SizedBox(height: 20),
                CatCircleAvatar(),
                SizedBox(height: 20),
                CustomTextField(
                  controller: controller.idController,
                  hintText: 'ID',
                  isEmail: false,
                  isIdPw: true,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: controller.pwController,
                  hintText: 'PW',
                  isEmail: false,
                  isIdPw: true,
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomElevatedButton(
                      title: '로그인',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          LoginController().login(
                            controller.idController.text,
                            controller.pwController.text,
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      style: TextButton.styleFrom(foregroundColor: Colors.grey),
                      onPressed: () {
                        Get.toNamed(ScreenRoutes.signup);
                      },
                      child: Text(
                        '새로 회원가입',
                        style: CustomTextStyle.title.copyWith(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
