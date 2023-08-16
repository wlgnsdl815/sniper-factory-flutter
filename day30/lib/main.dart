import 'package:day30/controllers/coin_controller.dart';
import 'package:day30/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CoinController());
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
