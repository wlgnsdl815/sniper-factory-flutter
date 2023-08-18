// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:day33/styles/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxLines;
  final bool isEmail;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines,
    required this.isEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (isEmail) {
          final RegExp emailValidator = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");

          if (!emailValidator.hasMatch(value ?? '')) {
            return '유효한 이메일을 입력해주세요';
          }
        }
        if (!isEmail) {
          if (value == null || value.isEmpty || value.length < 9) {
            return '9자 이상 입력해주세요';
          }
        }
        return null;
      },
      maxLines: maxLines,
      controller: controller,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: CustomTextStyle.content,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusColor: Colors.grey,
      ),
    );
  }
}
