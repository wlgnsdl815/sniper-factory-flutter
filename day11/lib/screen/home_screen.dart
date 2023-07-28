// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('0'),
            for (var i = 1; i < 100; i++)
              Text(
                i.toString(),
              ),
            Text('101'),
          ],
        ),
      ),
    );
  }
}
