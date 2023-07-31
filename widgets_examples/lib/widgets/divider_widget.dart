import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Divider Widget'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0.0,
          centerTitle: false,
          leading: Icon(Icons.people),
          actions: [
            Icon(Icons.share),
          ],
        ),
        body: Column(
          children: [
            ListTile(
              title: Text('1번 타일'),
            ),
            Divider(
              // 위 아래 간격
              height: 48,
              // 선 굵기
              thickness: 4,
              // 얼마나 들여쓰기 할 것인지(패딩 같은 기능)
              indent: 24,
              endIndent: 24,
              color: Colors.red,
            ),
            ListTile(
              title: Text('1번 타일'),
            ),
          ],
        ));
  }
}
