// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ThirdAssignment extends StatelessWidget {
  const ThirdAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = PageController(viewportFraction: 0.6);
    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(
          fontSize: 50.0,
          color: Colors.black,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: PageView(
              controller: pageController,
              children: [
                Container(color: Colors.red),
                Container(color: Colors.green),
                Container(color: Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
