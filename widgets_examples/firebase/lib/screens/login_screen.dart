// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('ID를 입력하세요'),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('PW를 입력하세요'),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('로그인하기'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('회원가입하기'),
            ),
          ],
        ),
      ),
    );
  }
}
