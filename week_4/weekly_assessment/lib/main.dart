import 'package:flutter/material.dart';
import 'package:weekly_assessment/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Neo',
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: MainScreen(),
    );
  }
}
