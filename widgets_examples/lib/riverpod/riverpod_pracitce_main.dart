import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_examples/riverpod/screens/home_screen.dart';
import 'package:widgets_examples/riverpod/services/user_service.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    UserService().getUsers();
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
