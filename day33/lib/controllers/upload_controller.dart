import 'package:day33/services/secret_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  TextEditingController secretController = TextEditingController();
  RxString _author = ''.obs;
  RxString _authorName = ''.obs;

  setAuthor(String author, String authorName) {
    _author = author.obs;
    _authorName = authorName.obs;
  }

  upload() async {
    await SecretService().postUploadSecret(
      secret: secretController.text,
      author: _author.value,
      authorName: _authorName.value,
    );
    SecretService().getSecretList();
    secretController.clear();
  }
}
