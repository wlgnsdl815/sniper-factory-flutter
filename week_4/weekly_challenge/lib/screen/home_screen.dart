import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:day16/components/heart_icon.dart';
import 'package:day16/main.dart';
import 'package:day16/screen/detail_secreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
  double currentOpacity = 0;

  final RefreshController _refreshController = RefreshController();
  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _connectionCheck();
  }

  void _onRefresh() async {
    setState(() {
      isRefreshing = true;
    });

    await Future.delayed(Duration(seconds: 2));

    _refreshController.refreshCompleted();

    setState(() {
      isRefreshing = false;
      currentOpacity = 1;
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
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    var box = Hive.box(favoriteBox);
                    return ValueListenableBuilder(
                      valueListenable: Hive.box(favoriteBox).listenable(),
                      builder: (context, value, child) {
                        return box.keys.isNotEmpty
                            ? ListView.builder(
                                itemCount: box.keys.length,
                                itemBuilder: (context, index) {
                                  var items = box.values.elementAt(index);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 12.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              16.0,
                                            ),
                                          ),
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                            items['url'],
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Center(
                                                  child: Text('이미지가 없다니까요!'));
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          '${items['msg']}',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  );
                                })
                            : Center(
                                child: Text(
                                  '좋아요 목록이 비어있습니다.',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                      },
                    );
                  });
            },
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
              onTap: () {
                final box = Hive.box(favoriteBox);
                box.clear();
              },
              child: Icon(
                Icons.close,
              ),
            ),
          ),
        ],
        // 앱바의 뒤로가기 없애기
        automaticallyImplyLeading: false,
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
              : _renderFutureBuilder(),
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

  FutureBuilder<Response<dynamic>> _renderFutureBuilder() {
    return FutureBuilder(
        future: dio.get('https://sniperfactory.com/sfac/read_dogs'),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.done
            ? SmartRefresher(
                header: MaterialClassicHeader(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                enablePullDown: true,
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
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  // 시고르자브종은 이미지 불러오기가 안되어서 빈 화면을 보여준다.
                                  snapshot.data!.data['body'][index]['url'],
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Text(
                                        '이미지가 없어요 ㅠㅠ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    );
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          // PageRouteBuilder로 스크린이 변할 때 넘어가는 애니메이션 없앴다.
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                DetailScreen(
                                                    images: snapshot
                                                            .data!.data['body']
                                                        [index]['url'],
                                                    // tag는 유니크해야해서, index를 넘겨주었다.
                                                    tag: 'imageHero-$index'),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: 'imageHero-$index',
                                        child: Icon(
                                          Icons.insert_comment,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    HeartIcon(
                                      imgUrl: snapshot.data!.data['body'][index]
                                          ['url'],
                                      msg: snapshot.data!.data['body'][index]
                                          ['msg'],
                                      index: index,
                                    ),
                                  ],
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
