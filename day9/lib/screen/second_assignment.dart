// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SecondAssignment extends StatefulWidget {
  const SecondAssignment({super.key});

  @override
  State<SecondAssignment> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondAssignment> {
  var controller = TextEditingController(); // 컨트롤러 생성
  String text = ''; // 빈 텍스트 생성

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '2번 과제',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                // 값이 변경되면
                setState(() {
                  // setState를 통해서 text값을 value에서 받는다.
                  text = value;
                });
              },
              controller: controller,
            ),
            Text(controller.text),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // 버튼이 눌리면 초기화
            controller.text = '';
          });
        },
        child: Icon(
          Icons.close,
        ),
      ),
    );
  }
}
