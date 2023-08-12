import 'package:flutter/material.dart';
import 'package:weekly_assessment/screens/models/fruit_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          FruitService().getData().toString(),
        ),
      ),
    );
  }
}
