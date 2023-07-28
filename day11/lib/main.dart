// ignore_for_file: prefer_const_constructors

import 'package:day11/screen/first_screen.dart';
import 'package:day11/screen/home_screen.dart';
import 'package:day11/screen/second_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecondScreen(),
    );
  }
}
