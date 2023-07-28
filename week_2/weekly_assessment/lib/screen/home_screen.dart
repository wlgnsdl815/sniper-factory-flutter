// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weekly_assessment/screen/admin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> orderList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.black,
        title: GestureDetector(
          onDoubleTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AdminScreen()));
          },
          child: Text(
            '분식왕 이테디 주문하기',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '주문 리스트',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Text(
            //   orderList.isEmpty ? '주문한 메뉴가 없습니다' : '$orderList',
            // ),
            if (orderList.isNotEmpty)
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: orderList.length,
                  itemBuilder: (context, index) {
                    return Wrap(
                      children: [
                        Chip(
                          onDeleted: () {
                            setState(() {
                              orderList.removeAt(index);
                            });
                          },
                          label: Text(orderList[index]),
                          deleteIcon: Icon(
                            Icons.cancel,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            if (orderList.isEmpty)
              SizedBox(
                height: 40.0,
                child: Align(
                  child: Text('주문한 메뉴가 없습니다.'),
                ),
              ),
            SizedBox(height: 20.0),
            Text(
              '음식',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      orderList.add(dataList[index]['name']!);
                    });
                  },
                  child: Card(
                    // 카드로 만들었다.
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            dataList[index]['url']!,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            // 가로 길이를 최대한으로 늘려준다
                          ),
                        ),
                        Text(
                          dataList[index]['name']!,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '[담기]',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: orderList.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {},
              label: Text('결제하기'),
            )
          : null,
    );
  }
}

List<Map<String, String>> dataList = [
  {
    'name': '떡볶이',
    'url': 'assets/option_bokki.png',
  },
  {
    'name': '맥주',
    'url': 'assets/option_beer.png',
  },
  {
    'name': '김밥',
    'url': 'assets/option_kimbap.png',
  },
  {
    'name': '오므라이스',
    'url': 'assets/option_omurice.png',
  },
  {
    'name': '돈까스',
    'url': 'assets/option_pork_cutlets.png',
  },
  {
    'name': '라면',
    'url': 'assets/option_ramen.png',
  },
  {
    'name': '우동',
    'url': 'assets/option_udon.png',
  },
];
