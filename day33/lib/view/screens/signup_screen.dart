import 'package:day33/controllers/signup_controller.dart';
import 'package:day33/services/user_service.dart';
import 'package:day33/styles/colors.dart';
import 'package:day33/styles/text_styles.dart';
import 'package:day33/widget/cat_circle_avatar.dart';
import 'package:day33/widget/custom_elevated_button.dart';
import 'package:day33/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  static const String route = '/signup';

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        foregroundColor: textColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '회원가입',
                  style: CustomTextStyle.title,
                ),
                SizedBox(height: 20),
                CatCircleAvatar(),
                SizedBox(height: 20),
                CustomTextField(
                  controller: controller.emailController,
                  hintText: 'Email',
                  isEmail: true,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: controller.pwController,
                  hintText: 'PW',
                  isEmail: false,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: controller.pw2Controller,
                  hintText: 'PW Confirm',
                  isEmail: false,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: controller.nameController,
                  hintText: 'Nickname',
                  isEmail: false,
                ),
                Expanded(child: SizedBox()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomElevatedButton(
                        title: '회원가입',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            UserService().postSignup(
                              email: controller.emailController.text,
                              pw: controller.pwController.text,
                              pw2: controller.pw2Controller.text,
                              name: controller.nameController.text,
                            );
                          }
                        }),
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
