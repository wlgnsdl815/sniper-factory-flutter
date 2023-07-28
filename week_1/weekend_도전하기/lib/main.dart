import 'package:flutter/material.dart';
import 'package:weekend_1/firstCode.dart';
import 'package:weekend_1/secondCode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecondCode(),
    );
  }
}
