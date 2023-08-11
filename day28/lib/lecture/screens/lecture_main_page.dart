// 추가 코드를 작성할 것. 본 소스는 디자인만 작성되어 있으며
// 이 기본 틀을 통하여 과제에 필요한 소스코드를 추가적으로 구현할 것.
import 'package:day28/lecture/components/dict_card.dart';
import 'package:day28/models/dictionary_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LectureMainPage extends StatefulWidget {
  const LectureMainPage({super.key});

  @override
  State<LectureMainPage> createState() => _MainPageState();
}

class _MainPageState extends State<LectureMainPage> {
  // 검색결과가 없을 수도 있어서 ?을 붙였다.
  Dictionary? dict;

  Dio dio = Dio();

  search(String query) async {
    String url = 'https://api.dictionaryapi.dev/api/v2/entries/en/';
    try {
      var res = await dio.get(url + query);
      var data = res.data.first;
      dict = Dictionary.fromJson(data);
      setState(() {});
    } catch (e) {
      dict = null;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary App'),
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onSubmitted: (value) {
                        search(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            if (dict != null)
              Expanded(
                child: SingleChildScrollView(child: DictCard(dict: dict!)),
              ),
          ],
        ),
      ),
    );
  }
}
