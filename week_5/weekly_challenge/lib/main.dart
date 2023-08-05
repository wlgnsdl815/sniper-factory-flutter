import 'package:flutter/material.dart';
import 'package:weekly_challenge/screen/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[300]),
      home: HomeScreen(),
    );
  }
}
