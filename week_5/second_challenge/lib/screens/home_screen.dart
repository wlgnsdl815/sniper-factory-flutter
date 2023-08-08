// ignore_for_file: refper_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:second_challenge/models/email_model.dart';
import 'package:second_challenge/screens/deleted_screen.dart';
import 'package:second_challenge/screens/search_screen.dart';
import 'package:second_challenge/services/email_service.dart';
import 'package:second_challenge/style/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RefreshController _refreshController = RefreshController();
  List<Email> deletedEmailList = [];
  List<Email> filteredEmailList = [];

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.refreshCompleted();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: Text(
          '프로모션',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.schedule,
              size: 30.0,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: EmailService().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Email> emailDataList = snapshot.data!;
              filteredEmailList = emailDataList
                  .where((element) => !deletedEmailList
                      .any((deletedEmail) => deletedEmail.from == element.from))
                  .toList();
              return SmartRefresher(
                onRefresh: _onRefresh,
                controller: _refreshController,
                child: ListView.builder(
                  itemCount: filteredEmailList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SearchScreen(
                                        filteredEmailList: filteredEmailList,
                                      )));
                        },
                        child: Container(
                          margin: EdgeInsets.all(4.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: primaryColor,
                              ),
                              Text(
                                '메일 검색',
                                style: TextStyle(color: primaryColor),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    if (index <= filteredEmailList.length) {
                      Email emailData = filteredEmailList[index - 1];

                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          deletedEmailList.add(emailData);
                          emailDataList.remove(emailData);
                        },
                        background: Container(
                          color: Colors.red[400],
                          child: Icon(
                            Icons.delete_outline,
                            size: 40.0,
                            color: Colors.white,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 4,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        emailData.from,
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Text(
                                        formatDate(emailData.sendDate),
                                        style: TextStyle(
                                          color: primaryColor,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.star,
                                        color: primaryColor,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(
                                          8.0,
                                        ),
                                        width: 35,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Text(
                                          'TO',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        emailData.title,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      emailData.detail,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => DeletedScreen(
                        deletedEmailList: deletedEmailList,
                      )));
        },
        backgroundColor: Colors.lightGreen,
        child: Icon(
          Icons.delete_outline,
        ),
      ),
    );
  }
}
