// ignore_for_file: prefer_const_constructors

import 'package:day9/screen/first_assignment.dart';
import 'package:day9/screen/second_assignment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('9일차 과제'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => FirstAssignment()));
              },
              child: Text('1번 과제'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SecondAssignment()));
              },
              child: Text('2번 과제'),
            ),
          ],
        ),
      ),
    );
  }
}
