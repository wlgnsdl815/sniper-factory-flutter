import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: MainScreen(),
    );
  }
}
