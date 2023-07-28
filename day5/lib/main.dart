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
        appBar: PreferredSize(
          // 앱바 사이즈 변경
          preferredSize: Size.fromHeight(300), // 높이에 사이즈 맞춘다

          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: Container(
              // Container를 집어넣어서 사진을 넣는다.
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/400/500'),
                  fit: BoxFit.fill, // 박스 채우기
                ),
              ),
            ),
            centerTitle: false,
            title: Text(
              'CGB (영화예매)',
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '속초 여행을 떠나면서',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.remove_red_eye,
                    ),
                    Text(
                      '232회',
                    ),
                  ],
                ),
                ListTile(
                  leading: CircleAvatar(
                    foregroundImage:
                        NetworkImage('https://picsum.photos/50/50'),
                  ),
                  title: Text(
                    '오류동 멋쟁이',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  subtitle: Text(
                    '스나이퍼팩토리 누군가',
                  ),
                  trailing: Text('3시간전'),
                ),
                Divider(
                  thickness: 1.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: Text(
                    '''애기 하나에 별 다 노루, 듯합니다. 경, 가을로 책상을 무엇인지 비둘기, 지나고 이름과, 봅니다. 불러 계절이 멀리 봅니다. 하나에 풀이 하늘에는 강아지, 애기 있습니다. 어머니, 하나에 하늘에는 파란 별빛이 된 오면 별들을 자랑처럼 봅니다. 하나에 하나에 아무 별 있습니다. 별빛이 새겨지는 위에 밤이 토끼, 있습니다. 패, 파란 아무 봅니다. 이름과, 파란 내일 어머님, 가슴속에 버리었습니다.''',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
