// ignore_for_file: prefer_const_constructors

import 'package:day16/screen/future_builder_test.dart';
import 'package:day16/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilderTest(),
    );
  }
}
