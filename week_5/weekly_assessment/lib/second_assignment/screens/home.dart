import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weekly_assessment/second_assignment/models/user_data.dart';

class Assignment23 extends StatefulWidget {
  const Assignment23({super.key});
  @override
  State<Assignment23> createState() => _Assignment23State();
}

class _Assignment23State extends State<Assignment23> {
  Future? result;

  Future<Map<String, dynamic>> getJsonData() async {
    try {
      Dio dio = Dio();
      var resp = await dio.get(
          'https://sfacassignment23-default-rtdb.europe-west1.firebasedatabase.app/.json');
      return resp.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void initState() {
    super.initState();
    result = getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('23일차 과제')),
      body: Center(
          child: FutureBuilder(
              future: getJsonData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CupertinoActivityIndicator();
                }
                if (!snapshot.hasData) return const Text("데이터가 없습니다");
                Map<String, dynamic> data =
                    snapshot.data as Map<String, dynamic>;
                List<dynamic> users = data['users'];
                List<dynamic> dismissDuplicatedUsers =
                    _dismissDuplicatedData(users);
                return ListView.separated(
                  itemBuilder: (context, index) {
                    UserData userData =
                        UserData.fromMap(dismissDuplicatedUsers[index]);

                    return _buildItemWidget(userData);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: dismissDuplicatedUsers.length,
                );
              })),
    );
  }

  Widget _buildItemWidget(UserData userData) {
    return ListTile(
      leading: Image.network(userData.imageUrl),
      title: Text('${userData.firstName} ${userData.lastName}'),
      subtitle: Text('${userData.phoneNumber}'),
    );
  }

  List<dynamic> _dismissDuplicatedData(List<dynamic> data) {
    List<UserData> userDataList = data.map((e) => UserData.fromMap(e)).toList();
    // Set을 통해 중복을 제거
    Set<UserData> userDataSet = userDataList.toSet();
    // 다시 List로 변환
    List<UserData> filteredDataList = userDataSet.toList();
    // Map으로 변환하고 리턴
    return filteredDataList.map((e) => e.toMap()).toList();
  }
}
