// ignore_for_file: prefer_const_constructors

import 'package:day23/day23_assignment/models/user_data.dart';
import 'package:day23/day23_assignment/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  // // 1번 과제
  // UserData userData = UserData(
  //   id: 'snpierFactory',
  //   birth: DateTime.now(),
  //   email: 'sniperfactory@naver.com',
  //   lastLoginDate: DateTime.now(),
  //   name: '스나이퍼',
  //   phoneNumber: '01023456789',
  // );

  // print(userData);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      home: HomeScreen(),
    );
  }
}
