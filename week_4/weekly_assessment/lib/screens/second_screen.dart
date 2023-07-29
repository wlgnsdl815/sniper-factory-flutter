import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:secret_cat_sdk/api/api.dart';
import 'package:weekly_assessment/const/colors.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {});
    _refreshController.refreshCompleted();
  }

  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SecretCatApi.fetchAuthors(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.done
                ? SmartRefresher(
                    onRefresh: _onRefresh,
                    controller: _refreshController,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundColor: primaryColor,
                          backgroundImage:
                              NetworkImage('${snapshot.data![index].avatar}'),
                        ),
                        title: Text(snapshot.data![index].name),
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator()));
  }
}
