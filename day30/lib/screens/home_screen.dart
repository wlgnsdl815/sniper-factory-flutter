// ignore_for_file: prefer_const_constructors

import 'package:day30/controllers/coin_controller.dart';
import 'package:day30/screens/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var coinController = Get.find<CoinController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Current coin: ${coinController.coin.value}',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            SizedBox(height: 10),
            Icon(
              FontAwesomeIcons.bitcoin,
              size: 96.0,
              color: Colors.yellow.shade700,
            ),
            TextButton(
              onPressed: () {
                Get.to(() => ShopScreen());
              },
              child: Text('상점으로 이동하기'),
            ),
          ],
        ),
      ),
    );
  }
}
