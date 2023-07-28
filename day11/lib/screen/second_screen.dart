// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Wrap(
            // 위젯의 너비를 숫자에 맞게 하기 위해.
            // 해주지 않으면 기본 ListView.builder의 children은 expanded가 되어서 최대 너비를 갖게된다.
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                width: mathData[index] * 2,
                height: 24,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                      spreadRadius: 2,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                child: Align(
                  child: Text('${mathData[index]}'),
                ),
              ),
            ],
          );
        },
        itemCount: mathData.length,
      ),
    );
  }
}

var mathData = [
  26,
  2,
  9,
  47,
  98,
  24,
  43,
  99,
  96,
  45,
  35,
  19,
  37,
  60,
  31,
  74,
  26,
  4,
  28,
  19,
  59,
  14,
  75,
  13,
  93,
  88,
  64,
  15,
  68,
  34,
  96,
  48,
  1,
  44,
  14,
  11,
  31,
  39,
  28,
  100,
  22,
  73,
  78,
  98,
  36,
  49,
  74,
  16,
  35,
  91,
  14,
  73,
  93,
  49,
  3,
  99,
  4,
  29,
  86,
  56,
  17,
  13,
  97,
  55,
  94,
  7,
  100,
  66,
  59,
  85,
  94,
  11,
  16,
  48,
  16,
  44,
  75,
  14,
  17,
  88,
  92,
  12,
  49,
  35,
  42,
  82,
  19,
  27,
  11,
  21,
  34,
  27,
  47,
  40,
  66,
  90,
  99,
  93,
  63,
  90
];
