// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:day30/controllers/coin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var coinController = Get.find<CoinController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '상점',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Obx(
              () => Text('현재 보유한 코인: ${coinController.coin.value}'),
            ),
            TextButton(
              onPressed: () {
                coinController.coin.value = 0;
              },
              child: Text('코인 리셋'),
            ),
          ],
        ),
      ),
    );
  }
}
