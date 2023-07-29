import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<HomeScreen> {
  Dio dio = Dio();
  RefreshController _refreshController = RefreshController();
  bool isRefreshing = false;
  bool isLoading = false;

  void _onRefresh() async {
    setState(() {
      isRefreshing = true;
    });

    await Future.delayed(Duration(seconds: 1));

    _refreshController.refreshCompleted();

    setState(() {
      isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '도전하기!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
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
          : isRefreshing
              ? Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.grey[200]!,
                  child: GridView.builder(
                      itemCount: 5,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
              : FutureBuilder(
                  future: dio.get('https://sniperfactory.com/sfac/read_dogs'),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.done
                          ? SmartRefresher(
                              controller: _refreshController,
                              onRefresh: _onRefresh,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemCount: 5,
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
                                              child: Image.network(snapshot
                                                  .data!
                                                  .data['body'][index]['url']),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text(
                                              snapshot.data!.data['body'][index]
                                                  ['msg'],
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
                                },
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            )),
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
            _onRefresh();
          });
        },
        child: Icon(
          Icons.wifi_find,
        ),
      ),
    );
  }
}
