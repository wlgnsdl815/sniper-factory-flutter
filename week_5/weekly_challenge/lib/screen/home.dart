import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weekly_challenge/components/custom_button.dart';
import 'package:weekly_challenge/components/custom_card.dart';
import 'package:weekly_challenge/main.dart';
import 'package:weekly_challenge/models/email_data.dart';
import 'package:weekly_challenge/screen/remove.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future? result;
  bool isRead = false;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    result = getData();
  }

  Future<Map<String, dynamic>> getData() async {
    try {
      Dio dio = Dio();
      Response<dynamic> resp = await dio.get(
        'https://sfacassignmentchallenge-default-rtdb.europe-west1.firebasedatabase.app/.json',
      );

      return resp.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  RefreshController _refreshController = RefreshController();

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.refreshCompleted();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Box<String> box = Hive.box<String>(removedListBox);
    List<dynamic> filterData = box.keys.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: GestureDetector(
          child: Text('프로모션'),
          onTap: () {
            _pageController.animateTo(
              1,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.schedule,
              size: 30,
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: FutureBuilder(
        future: result,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Map<String, dynamic>> dataList =
                List<Map<String, dynamic>>.from(snapshot.data['emails']);
            // future를 통해 받아온 데이터
            print('데이터 리스트 : $dataList');

            List<EmailData> emailDataList =
                dataList.map((e) => EmailData.fromJson(e)).toList();
            // 모델링 작업 후 다시 리스트에 담아준 이메일 데이터 리스트 Instance of 'EmailData'가 찍히므로 성공
            print('이메일 데이터 리스트 : $emailDataList');
            // 삭제한 값이 담긴 데이터 리스트
            print('휴지통 데이터 : $filterData');
            // 휴지통에 있는 값들이 emailData.from과 일치하지 않는 것만 필터링 = 휴지통에 없는 값만 필터링
            List<EmailData> filteredDataList = emailDataList
                .where(
                  (emailData) => !filterData.contains(emailData.from),
                )
                .toList();

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmartRefresher(
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                child: ListView.builder(
                  controller: _pageController,
                  // 위에서 필터링시킨 리스트의 길이를 받음
                  itemCount: filteredDataList.length,
                  itemBuilder: ((context, index) {
                    if (index == 0) {
                      return CustomButton();
                    }

                    return GestureDetector(
                      onTap: () {},
                      child: CustomCard(
                        isRead: isRead,
                        // 필터링 된 리스트 전달
                        emailData: filteredDataList[index],
                        onDismissed: (DismissDirection) {
                          Box box = Hive.box<String>(removedListBox);
                          // box.clear();
                          box.put(filteredDataList[index].from,
                              filteredDataList[index].title);

                          print('프린트 박스키 : ${box.keys}');
                          print('프린트 밸류 : ${box.values}');
                        },
                      ),
                    );
                  }),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => RemoveScreen()));
        },
        backgroundColor: Colors.lightGreen,
        child: Icon(
          Icons.delete_outline,
        ),
      ),
    );
  }
}
