import 'dart:math';

import 'package:flutter/material.dart';

class FutureBuilderTest extends StatefulWidget {
  const FutureBuilderTest({super.key});

  @override
  State<FutureBuilderTest> createState() => _FutureBuilderTestState();
}

class _FutureBuilderTestState extends State<FutureBuilderTest> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 16.0);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getNumber(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'FutureBuilder',
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'ConState : ${snapshot.connectionState}',
                  style: textStyle,
                ),
                Text(
                  'Data : ${snapshot.data}',
                  style: textStyle,
                ),
                Text(
                  'ConState : ${snapshot.error}',
                  style: textStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('Set State'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Future<int> 타입을 반환하는 함수
Future<int> getNumber() async {
  // 3초 지연
  await Future.delayed(
    Duration(seconds: 3),
  );
  final random = Random();
  // 0 ~ 100까지의 숫자 중 랜덤으로 하나 생성
  return random.nextInt(100);
}
