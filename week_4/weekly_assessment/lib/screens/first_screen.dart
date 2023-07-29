import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:secret_cat_sdk/api/api.dart';
import 'package:weekly_assessment/components/secret_card.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final RefreshController _refreshController = RefreshController();

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    await SecretCatApi.fetchSecrets();
    setState(() {});
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
          snapshot.connectionState == ConnectionState.done
              ? SmartRefresher(
                  header: WaterDropHeader(),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return SecretCard(secret: snapshot.data[index]);
                    },
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
      future: SecretCatApi.fetchSecrets(),
    );
  }
}
