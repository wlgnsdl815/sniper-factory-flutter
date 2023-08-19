import 'package:day33/services/secret_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  TextEditingController secretController = TextEditingController();
  RxString _author = ''.obs;
  RxString _authorName = ''.obs;
  RxString _originalAuthor = ''.obs;
  RxString _originalAuthorName = ''.obs;

  final RxBool _isChecked = true.obs;

  get isChecked => _isChecked.value;

  setAuthor(String author, String authorName) {
    _author = author.obs;
    _authorName = authorName.obs;
    return;
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

  onCheckBoxTap() {
    _isChecked.value = !_isChecked.value;

    if (_isChecked.value) {
      // 체크되었을 때 원래 값으로 복원
      _author.value = _originalAuthor.value;
      _authorName.value = _originalAuthorName.value;
    } else {
      // 체크되지 않았을 때 값 백업 후 빈 문자열로 설정
      _originalAuthor.value = _author.value;
      _originalAuthorName.value = _authorName.value;
      _author.value = '';
      _authorName.value = '';
    }
    print(_author);
    print(_authorName);
  }
}
