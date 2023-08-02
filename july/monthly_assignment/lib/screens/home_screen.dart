import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:monthly_assignment/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Map<String, dynamic>>? result;

  @override
  void initState() {
    super.initState();
    result = getData();
  }

  Future<Map<String, dynamic>> getData() async {
    Dio dio = Dio();
    Response res =
        await dio.get('http://52.79.115.43:8090/api/collections/news/records');
    return res.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('News'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
          future: result,
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!['items'].length,
                itemBuilder: (context, index) {
                  var item = snapshot.data!['items'][index];
                  return AspectRatio(
                    aspectRatio: 16 / 9,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailScreen(
                                      imgUrl: item['thumbnail'],
                                      content: item['content'],
                                      title: item['title'],
                                      author: item['author'],
                                      articleUrl: item['news_url'],
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(item['thumbnail']),
                            fit: BoxFit.cover,
                            opacity: 0.4,
                          ),
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                item['content'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
