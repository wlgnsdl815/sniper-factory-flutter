// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    // 컨트롤러 생성

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: PageView.builder(
            controller: pageController,
            // 컨트롤러 연결
            physics: NeverScrollableScrollPhysics(),
            // 버튼 아니면 넘어가지 않게 설정
            itemCount: words.length,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  words[index]['word']!,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                    // 단어 자간을 -1 (좁혀진다)
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  words[index]['meaning']!,
                  style: TextStyle(
                    fontSize: 20.0, color: Colors.grey, letterSpacing: -1,
                    // 뜻의 자간을 -1 (좁혀진다)
                  ),
                ),
                SizedBox(height: 13),
                Text(
                  '"${words[index]['example']}"',
                  style: TextStyle(
                    fontSize: 15.0, color: Colors.grey, letterSpacing: 1,
                    // 예문의의 자간을 1 (늘린다)
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                pageController.previousPage(
                  duration: Duration(milliseconds: 500),
                  // 페이지 넘어가는 속도
                  curve: Curves.easeIn,
                );
              },
              child: Icon(Icons.navigate_before),
            ),
            FloatingActionButton(
              onPressed: () {
                pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              child: Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // FloatingActionButton 위치 지정
    );
  }
}

List<Map<String, String>> words = [
  {
    "word": "apple",
    "meaning": "사과",
    "example": "I want to eat an apple",
  },
  {
    "word": "paper",
    "meaning": "종이",
    "example": "Could you give me a paper",
  },
  {
    "word": "resilient",
    "meaning": "탄력있는, 회복력있는",
    "example": "She's a resilient girl"
  },
  {
    "word": "revoke",
    "meaning": "취소하다",
    "example":
        "The authorities have revoked their original decision to allow development of this rural area.",
  },
  {
    "word": "withdraw",
    "meaning": "철회하다",
    "example":
        "After lunch, we withdrew into her office to finish our discussion in private.",
  },
];
