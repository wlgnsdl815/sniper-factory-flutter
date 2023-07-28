// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  final Map<String, dynamic> quiz;
  final Function onCorrect;
  final Function onIncorrect;

  const QuizCard({
    super.key,
    required this.quiz,
    required this.onCorrect,
    required this.onIncorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Card를 최대한 가운데 정렬하기 위해서 추가한 SizedBox
        SizedBox(),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.35,
          height: MediaQuery.of(context).size.height / 1.5,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                24.0,
              ),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // 가로로 최대한 늘린다
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 두가지의 질문은 한줄에 가운데 정렬, 나머지는 두줄에 왼쪽 정렬
                  quiz['question'] == '다음 중 바다가 아닌 곳은?' ||
                          quiz['question'] == '택시 번호판의 바탕색은?'
                      ? Text(
                          quiz['question'],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          quiz['question'],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // 각 페이지에서 정답을 찾는 과정이다.
                      // answer와 누른 답이 일치하면 onCorrect, 틀리면 onIncorrect를 넘겨준다.
                      // 각 컨테이너 마다 숫자를 한개씩 가지고 있다 (1 ~ 4)
                      // 함수 실행을 위해서 onCorrect뒤에 ()를 붙여야한다.
                      quiz['answer'] == 1 ? onCorrect() : onIncorrect();
                    },
                    child: Text(
                      quiz['options'][0],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      quiz['answer'] == 2 ? onCorrect() : onIncorrect();
                    },
                    child: Text(
                      quiz['options'][1],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      quiz['answer'] == 3 ? onCorrect() : onIncorrect();
                    },
                    child: Text(
                      quiz['options'][2],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      quiz['answer'] == 4 ? onCorrect() : onIncorrect();
                    },
                    child: Text(
                      quiz['options'][3],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Container(
        //   color: Colors.black,
        //   height: 1,
        // ),
      ],
    );
  }
}
