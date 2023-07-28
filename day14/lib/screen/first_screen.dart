import 'package:day14/data/img_url.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<FirstScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  // 밑으로 당기면 _onRefresh가 불린다
  void _onRefresh() {
    setState(() {
      // 이미지 리스트를 섞어서 랜덤으로 계속 출력
      imageUrl.shuffle();
    });

    // 컨트롤러로 refresh가 끝났다고 알림
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('14일차 과제 3번'),
        centerTitle: false,
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(),
        onRefresh: _onRefresh,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: Image.network(imageUrl.first),
          ),
        ),
      ),
    );
  }
}
