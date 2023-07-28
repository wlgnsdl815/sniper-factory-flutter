// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FirstAssignment extends StatelessWidget {
  const FirstAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '1번 과제',
        ),
      ),
      body: Column(
        // 아래에 페이지를 넘기는 버튼을 추가하기 위해 Column으로 감싸주었다
        children: [
          Expanded(
            // overflow 방지를 위해 expanded를 사용
            child: ListView.builder(
              controller: scrollController,
              itemBuilder: (context, index) {
                return Center(
                  child: SizedBox(
                    height: 300,
                    child: Text(
                      animalList[index],
                    ),
                  ),
                );
              },
              itemCount: animalList.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scrollController.jumpTo(0);
        },
        child: Icon(Icons.vertical_align_top),
      ),
    );
  }
}

List animalList = [
  '강아지',
  '고양이',
  '앵무새',
  '토끼',
  '오리',
  '거위',
  '원숭이',
];
