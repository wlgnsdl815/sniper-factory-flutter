// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Page',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              '메뉴 추가',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              '메뉴 삭제',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              '메뉴 수정',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
