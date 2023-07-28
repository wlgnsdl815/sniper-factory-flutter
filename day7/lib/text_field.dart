// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextField(
            cursorColor: Colors.green, // 커서 색상 변경
            decoration: InputDecoration(
              labelStyle: TextStyle(
                // label에 색상 넣기
                color: Colors.black,
              ),
              label: Text(
                // label 달기
                '이메일 입력',
              ),
              hintText: '이메일 입력하세요',
              fillColor: Colors.black12, // 배경 색 달기
              filled: true, // true 로 해줘야 보인다
              border: InputBorder.none, // 아래 줄 없애기
            ),
          ),
        ),
      ),
    );
  }
}
