// ignore_for_file: prefer_const_constructors

import 'package:day20/screens/admin_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // getData()를 담을 Future변수 선언
  Future? result;
  SharedPreferences? pref;
  List<String> orderList = [];

  @override
  void initState() {
    super.initState();
    initPreference();
    // result에 getData()를 실행한 값을 넣는다
    result = getData();
  }

  void initPreference() async {
    pref = await SharedPreferences.getInstance();
    if (pref != null) {
      orderList = pref!.getStringList('orderList') ?? [];
      setState(() {});
    }
  }

  Future getData() async {
    Dio dio = Dio();
    var resp = await dio
        .get('http://52.79.115.43:8090/api/collections/options/records');
    if (resp.statusCode == 200) {
      return resp;
    }
  }

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
            if (orderList.isNotEmpty)
              Wrap(
                direction: Axis.horizontal,
                children: List<Widget>.generate(
                  orderList.length,
                  (int index) {
                    return Chip(
                      onDeleted: () {
                        setState(() {
                          orderList.removeAt(index);
                        });
                        pref!.remove('orderList');
                      },
                      label: Text(orderList[index]),
                      deleteIcon: Icon(
                        Icons.cancel,
                      ),
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
            Expanded(
              child: FutureBuilder(
                future: result,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: snapshot.data!.data['items'].length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              orderList.add(
                                  snapshot.data!.data['items'][index]['menu']);
                              if (pref != null) {
                                pref!.setStringList(
                                  'orderList',
                                  orderList,
                                );
                              }
                            });
                          },
                          child: Card(
                            // 카드로 만들었다.
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    snapshot.data!.data['items'][index]
                                        ['imageUrl'],
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.data['items'][index]['menu'],
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
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
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
