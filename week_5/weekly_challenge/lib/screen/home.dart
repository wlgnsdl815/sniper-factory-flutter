// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
          if(snapshot.hasData) {}
          return Column(
            children: [
              Text(snapshot.data.toString()),
            ],
          );
        },
      ),
    );
  }
}
