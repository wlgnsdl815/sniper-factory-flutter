// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '오늘의 하루는',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '어땠나요?',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25.0,
                  ),
                ),
                RenderContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RenderContainer extends StatelessWidget {
  RenderContainer({super.key});

  final containerDataList = [
    ContainerData(
      gradient: [Colors.grey, Colors.white],
      text: '우울함',
    ),
    ContainerData(
      gradient: [Colors.orange, Colors.yellow],
      text: '행복함',
    ),
    ContainerData(
      gradient: [Colors.blue, Colors.green],
      text: '상쾌함',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 400,
      child: PageView.builder(
        itemCount: containerDataList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              gradient: LinearGradient(
                colors: containerDataList[index].gradient,
              ),
            ),
            child: Center(
              child: Text(
                containerDataList[index].text,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerData {
  final List<Color> gradient;
  final String text;
  ContainerData({
    required this.gradient,
    required this.text,
  });
}
