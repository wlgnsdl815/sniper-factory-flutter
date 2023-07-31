// ignore_for_file: prefer_const_constructors

import 'package:day19/screens/detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          '19일차 과제',
        ),
      ),
      body: FutureBuilder(
        future: dio.get('https://sniperfactory.com/sfac/read_dogs'),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? ListView.builder(
                  itemCount: snapshot.data!.data['body'].length,
                  itemBuilder: (context, index) {
                    // 인덱스가 5인 경우(스고르자브종) 건너뛰기
                    if (index == 5) return SizedBox();
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => DetailScreen(
                                          imgUrl: snapshot.data!.data['body']
                                              [index]['url'],
                                          heroTag: 'heroTag$index'),
                                    ));
                              },
                              child: Hero(
                                tag: 'heroTag$index',
                                child: Image.network(
                                  snapshot.data!.data['body'][index]['url'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            snapshot.data!.data['body'][index]['msg'],
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
