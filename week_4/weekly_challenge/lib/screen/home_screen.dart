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
  bool isRefreshing = false;
  bool isLoading = false;

  final RefreshController _refreshController = RefreshController();
  final PageController _pageController = PageController();

  void _onRefresh() async {
    setState(() {
      isRefreshing = true;
    });

    await Future.delayed(Duration(seconds: 2));

    _refreshController.refreshCompleted();

    setState(() {
      isRefreshing = false;
    });
  }

  void _connectionCheck() async {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            _pageController.animateTo(
              0,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          child: Text(
            '도전하기!',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: isLoading
          ? _renderCircle()
          : isRefreshing
              ? _renderShimmer()
              : _renderFutureBuild(),
      floatingActionButton: FloatingActionButton(
        onPressed: _connectionCheck,
        child: Icon(
          Icons.wifi_find,
        ),
      ),
    );
  }

  Center _renderCircle() {
    return Center(
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
    );
  }

  Shimmer _renderShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[200]!,
      child: GridView.builder(
          itemCount: 10,
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
              ),
            );
          }),
    );
  }

  FutureBuilder<Response<dynamic>> _renderFutureBuild() {
    return FutureBuilder(
        future: dio.get('https://sniperfactory.com/sfac/read_dogs'),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.done
            ? SmartRefresher(
                header: MaterialClassicHeader(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                child: GridView.builder(
                  controller: _pageController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: snapshot.data!.data['body'].length,
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
                                  // 시고르자브종은 이미지 불러오기가 안되어서 빈 화면을 보여준다.
                                  snapshot.data!.data['body'][index]['url'],
                                  errorBuilder: (context, error, stackTrace) {
                                    return SizedBox();
                                  },
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                snapshot.data!.data['body'][index]['msg'],
                                style: TextStyle(fontWeight: FontWeight.bold),
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
              ));
  }
}
