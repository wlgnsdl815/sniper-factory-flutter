import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weekly_challenge/models/email_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future? result;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: Text('프로모션'),
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
            print(snapshot.data['emails']);
            print(snapshot.data['emails'].runtimeType);
            // dataList를 snapshot.data['emails']에서 새로운 리스트를 만들고 집어넣었다.
            // 이렇게 하지 않으면 타입에러가 났다.
            List<Map<String, dynamic>> dataList =
                List<Map<String, dynamic>>.from(snapshot.data['emails']);

            List<EmailData> emailList =
                dataList.map((e) => EmailData.fromJson(e)).toList();

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SmartRefresher(
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                child: ListView.builder(
                  // 첫번째 인덱스에는 텍스트 필드를 넣기 위해서 길이를 하나 늘렸다.
                  itemCount: snapshot.data['emails'].length + 1,
                  itemBuilder: ((context, index) {
                    if (index == 0) return TextField();
                    return Card(
                      child: Row(
                        children: [
                          Text(
                            emailList[index - 1].from,
                          ),
                        ],
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
    );
  }
}
