import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:monthly_assignment/components/image_container.dart';
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
      body: RenderBody(result: result),
    );
  }
}

class RenderBody extends StatelessWidget {
  const RenderBody({
    super.key,
    required this.result,
  });

  final Future<Map<String, dynamic>>? result;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: result,
        builder: (context, snapshot) {
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
                            heroTag: 'imageTag$index',
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: 'imageTag$index',
                      child: FadeIn(
                        duration: Duration(seconds: 2),
                        child: ImageContainer(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          imgUrl: item['thumbnail'],
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
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
