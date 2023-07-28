import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<FirstScreen> {
  // 값을 받을 items
  Map<String, dynamic> items = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 제일 처음 앱을 초기화 할때 getData()를 불러서 값을 불러들인다.
    getData();
  }

  Dio dio = Dio();
  String url = 'https://sniperfactory.com/sfac/http_json_data';

  void getData() async {
    final res = await dio.get(url);
    setState(() {
      // items에 값을 넣어준다
      items = res.data['item'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Center(
        // 사진을 불러오기 전에 null이 들어오는 걸 CircularProgressIndicator로 처리했다.
        child: items.isEmpty
            ? CircularProgressIndicator()
            : Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      8.0,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.network(
                        items['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Divider(),
                          Text(
                            items['description'],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('${items['price']}원 결제하고 등록'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
