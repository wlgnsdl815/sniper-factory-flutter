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
        body: Center(
          child: Container(
            height: 150,
            padding: EdgeInsets.fromLTRB(
                8, 24, 8, 24), // 왼쪽 8, 위쪽 24, 오른쪽 8, 아래쪽 24의 패딩을 주었다
            decoration: BoxDecoration(
              color: Colors.blue[600],
            ),
            child: Row(
              children: [
                Container(
                  child: Image.asset('assets/images/avata.png'),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  // 글자가 있는 컬럼의 공간을 최대로 차지해서 아이콘을 오른쪽에 배치하기 위해 Expanded 위젯사용
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // 글자를 세로로 가운데 정렬
                    crossAxisAlignment: CrossAxisAlignment.start, // 글자를 왼쪽 정렬
                    children: [
                      Text(
                        'jihooniii',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '플러터 공부중',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        'Flutter, Flutter',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 40.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
