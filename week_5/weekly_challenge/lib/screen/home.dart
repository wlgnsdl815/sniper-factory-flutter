import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weekly_challenge/components/custom_button.dart';
import 'package:weekly_challenge/components/custom_card.dart';
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
            // print(snapshot.data['emails']);
            // print(snapshot.data['emails'].runtimeType);
            // dataList를 snapshot.data['emails']에서 새로운 리스트를 만들고 집어넣었다.
            // 이렇게 하지 않으면 타입에러가 났다.
            List<Map<String, dynamic>> dataList =
                List<Map<String, dynamic>>.from(snapshot.data['emails']);

            List<EmailData> emailDataList =
                dataList.map((e) => EmailData.fromJson(e)).toList();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmartRefresher(
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                child: ListView.builder(
                  controller: _pageController,
                  // 첫번째 인덱스에는 텍스트 필드를 넣기 위해서 길이를 하나 늘렸다.
                  itemCount: snapshot.data['emails'].length + 1,
                  itemBuilder: ((context, index) {
                    if (index == 0) {
                      return CustomButton();
                    }
                    return GestureDetector(
                      onTap: () {},
                      child: CustomCard(
                        isRead: isRead,
                        emailData: emailDataList[index - 1],
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
