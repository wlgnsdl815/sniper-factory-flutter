// ignore_for_file: prefer_const_constructors

import 'package:day9/screen/fourth_assignment.dart';
import 'package:day9/screen/home_screen.dart';
import 'package:day9/screen/third_assignment.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FourthAssignment(),
    );
  }
}
