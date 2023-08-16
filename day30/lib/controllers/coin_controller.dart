// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinController extends GetxController {
  RxInt coin = 0.obs;

  @override
  void onInit() {
    super.onInit();

    Timer.periodic(Duration(seconds: 1), (timer) {
      coin++;
    });
    ever(coin, (value) {
      if (value != 0 && value % 10 == 0) {
        Get.snackbar('코인 $value개 돌파', '축하합니다!');
      }
    });
  }
}
