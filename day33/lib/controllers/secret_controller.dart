import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecretController extends GetxController {
  final PageController pageController = PageController();
  final RxList _list = RxList();

  get getList => _list;

  setList(List list) {
    _list(list);
  }
}
