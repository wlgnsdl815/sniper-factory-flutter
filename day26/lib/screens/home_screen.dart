import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: false,
        title: Text('Todo App'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }
}
