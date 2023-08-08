// ignore_for_file: prefer_const_constructors
import 'dart:developer';

import 'package:day24/models/dog_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면에 그리기 전에 데이터를 담을 List
    List<Dog> dogsList = [];

    // StreamBuilder를 사용하기 위해서 async에 *을 붙여서 사용하면 된다.
    Stream<List<Dog>> getData() async* {
      try {
        Dio dio = Dio();
        String url = 'https://dog.ceo/api/breeds/image/random';

        List<Dog> dogsList = [];

        // 객체를 여러개 생성해서 dagsList에 담아준다.
        for (int i = 0; i < 99; i++) {
          Response<Map<String, dynamic>> response = await dio.get(url);
          Dog dogs = Dog.fromMap(response.data!);
          dogsList.add(dogs);
          // return 대신에 yield 키워드
          yield dogsList;
          log(name: 'dogsList', '${dogsList[i].message}');
        }
      } catch (e) {
        throw Exception(e);
      }
    }

    return Scaffold(
      // 데이터가 들어오는 순서대로 보여주기 위해서 StreamBuilder를 사용
      body: StreamBuilder(
        stream: getData(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: ((context, index) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          // Dialog 외부 클릭하면 닫힌다
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  height: 400,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Image.network(
                                          snapshot.data![index].message,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Close'))
                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Image.network(
                      snapshot.data![index].message,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
