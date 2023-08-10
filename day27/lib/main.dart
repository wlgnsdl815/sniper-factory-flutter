// ignore_for_file: prefer_const_constructors

import 'package:day27/screens/home_screen.dart';
import 'package:day27/services/user_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    UserService().getData();
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
