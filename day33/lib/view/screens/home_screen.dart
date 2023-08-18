// ignore_for_file: prefer_const_constructors

import 'package:day33/styles/text_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('수많은 비밀을 알고 있는'),
              Text(
                '비밀 듣는 고양이',
                style: CustomTextStyle.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
