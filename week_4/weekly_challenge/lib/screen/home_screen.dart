import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dio dio = Dio();
  Map<String, dynamic> dataList = {};
  // 리프레시 상태면 shimmer가 나오게
  bool isRefreshing = false;
  // 인터넷 연결 상태 확인하기 위한 변수 선언
  bool isLoading = false;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // 눌렀을 때 처음 isRefreshing을 true로 바꾸어서 shimmer동작
    setState(() {
      isRefreshing = true;
    });
    // 1초 기다리기
    await Future.delayed(Duration(milliseconds: 1000));
    await getData();
    _refreshController.refreshCompleted();
    // refresh가 끝나면 다시 shimmer 없애기
    setState(() {
      isRefreshing = false;
    });
  }

  @override
  void initState() {
    super.initState();

    // Dio로 데이터를 불러온다
    getData();
  }

  Future<void> getData() async {
    var res = await dio.get('https://sniperfactory.com/sfac/read_dogs');

    setState(() {
      dataList = res.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '16일차 과제 2번',
        ),
      ),
      body: isLoading
          // 상태가 로딩이면 텍스트 출력
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('인터넷 연결 확인중입니다.'),
                  SizedBox(height: 10.0),
                  // SpinKit 패키지 인디케이터 사용
                  SpinKitFadingCircle(
                    color: Colors.grey,
                    size: 50.0,
                  ),
                ],
              ),
            )
          : SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              onRefresh: _onRefresh,
              header: MaterialClassicHeader(),
              // dataList['body']가 널이 아니면 isRefreshing인지 검사, null이면 CircularProgressIndicator
              child: dataList['body'] != null
                  ? isRefreshing
                      // 로딩중이면 Shimmer를 감싼 그리드뷰
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey[200]!,
                          child: GridView.builder(
                              itemCount: 5,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                      16.0,
                                    )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          Container(
                                            width: double.infinity,
                                            height: 8.0,
                                            color: Colors.white,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Icon(
                                              Icons.insert_comment,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      // 로딩이 끝나면 원래 그리드뷰로 데이터 보여주기
                      : GridView.builder(
                          itemCount: 5,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                  16.0,
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Image.network(
                                            dataList['body'][index]['url']),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        dataList['body'][index]['msg'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Icon(
                                          Icons.insert_comment,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                  : CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            isLoading = true;
          });

          await Future.delayed(Duration(seconds: 2), () async {
            return await Connectivity().checkConnectivity();
          });

          setState(() {
            isLoading = false;
          });
        },
        child: Icon(
          Icons.wifi_find,
        ),
      ),
    );
  }
}
