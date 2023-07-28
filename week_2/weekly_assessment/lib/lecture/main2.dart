// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:weekly_assessment/lecture/option_card.dart';

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  List myMenu = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('분식왕 이테디 주문하기'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '주문리스트',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(myMenu.toString()),
            SizedBox(height: 8),
            Text(
              '음식',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                InkWell(
                  onTap: () {
                    myMenu.add('떡볶이');
                    setState(() {});
                  },
                  child: OptionCard(
                    foodName: '떡볶이',
                    imgUrl: 'assets/option_bokki.png',
                  ),
                ),
                InkWell(
                  onTap: () {
                    myMenu.add('맥주');
                    setState(() {});
                  },
                  child: OptionCard(
                    foodName: '맥주',
                    imgUrl: 'assets/option_beer.png',
                  ),
                ),
                InkWell(
                  onTap: () {
                    myMenu.add('김밥');
                    setState(() {});
                  },
                  child: OptionCard(
                    foodName: '김밥',
                    imgUrl: 'assets/option_kimbap.png',
                  ),
                ),
                InkWell(
                  onTap: () {
                    myMenu.add('오므라이스');
                    setState(() {});
                  },
                  child: OptionCard(
                    foodName: '오므라이스',
                    imgUrl: 'assets/option_omurice.png',
                  ),
                ),
                InkWell(
                  onTap: () {
                    myMenu.add('돈까스');
                    setState(() {});
                  },
                  child: OptionCard(
                    foodName: '돈까스',
                    imgUrl: 'assets/option_pork_cutlets.png',
                  ),
                ),
                InkWell(
                  onTap: () {
                    myMenu.add('라면');
                    setState(() {});
                  },
                  child: OptionCard(
                    foodName: '라면',
                    imgUrl: 'assets/option_ramen.png',
                  ),
                ),
                InkWell(
                  onTap: () {
                    myMenu.add('우동');
                    setState(() {});
                  },
                  child: OptionCard(
                    foodName: '우동',
                    imgUrl: 'assets/option_udon.png',
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            myMenu = [];
            setState(() {});
          },
          label: Text(
            '초기화하기',
          ),
        ),
      ),
    );
  }
}
