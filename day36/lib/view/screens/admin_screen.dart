// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  static const route = '/admin';

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
            _Text(title: '메뉴 추가'),
            _Text(title: '메뉴 삭제'),
            _Text(title: '메뉴 수정'),
          ],
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  final String title;
  const _Text({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 30.0,
      ),
    );
  }
}
