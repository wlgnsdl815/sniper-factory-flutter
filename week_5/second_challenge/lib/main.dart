import 'package:flutter/material.dart';
import 'package:second_challenge/screens/home_screen.dart';
import 'package:second_challenge/services/email_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    EmailService().getData();
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
