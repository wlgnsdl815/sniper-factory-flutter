import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weekly_challenge/components/custom_button.dart';
import 'package:weekly_challenge/components/custom_card.dart';
import 'package:weekly_challenge/main.dart';
import 'package:weekly_challenge/models/email_model.dart';
import 'package:weekly_challenge/screen/remove.dart';
import 'package:weekly_challenge/services/email_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Email> _emailDataList = [];
  bool _isSorted = true;

  final PageController _pageController = PageController();

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    EmailService().getData();
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.refreshCompleted();
  }

  void sortEmails(List<Email> emailList) {
    setState(() {
      _emailDataList.sort((a, b) => _isSorted
          ? b.sendDate.compareTo(a.sendDate)
          : a.sendDate.compareTo(b.sendDate));
      // 정렬 상태를 반전시킵니다.
      _isSorted = !_isSorted;
    });
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
            onPressed: () {
              sortEmails(_emailDataList);
              print(_emailDataList);
            },
            icon: Icon(
              Icons.schedule,
              size: 30,
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: FutureBuilder(
        future: EmailService().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Email> emailDataList = snapshot.data!;

            // 모델링 작업 후 다시 리스트에 담아준 이메일 데이터 리스트 Instance of 'Email'가 찍히므로 성공
            print('이메일 데이터 리스트 : $emailDataList');
            // 삭제한 값이 담긴 데이터 리스트
            print('휴지통 데이터 : $filterData');
            // 휴지통에 있는 값들이 emailData.from과 일치하지 않는 것만 필터링 = 휴지통에 없는 값만 필터링
            List<Email> filteredDataList = emailDataList
                .where(
                  (emailData) => !filterData.contains(emailData.from),
                )
                .toList();
            _emailDataList = filteredDataList;

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
                    return CustomCard(
                      // 필터링 된 리스트 전달
                      emailData: filteredDataList[index],
                      onDismissed: (direction) {
                        Box box = Hive.box<String>(removedListBox);
                        // box.clear();
                        box.put(filteredDataList[index].from,
                            filteredDataList[index].title);

                        print('프린트 박스키 : ${box.keys}');
                        print('프린트 밸류 : ${box.values}');
                      },
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
