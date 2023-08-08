import 'package:flutter/material.dart';
import 'package:weekly_assessment/first_assignment/models/article_data.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Article> articles =
      articleDataList.map((e) => Article.fromMap(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: articles.length + 1,
          // 맨 위와 아래에 구분선을 넣기 위해서 itemBuilder에 Divider를 separatorBuilder에 내용을 넣었다.
          itemBuilder: ((context, index) => Divider(
                thickness: 1.0,
                color: Colors.grey,
              )),
          separatorBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      articles[index].title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontFamily: 'ArticleStyle',
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(
                      articles[index].thumbnailImg,
                    ),
                  ),
                ],
              ),
              Text(
                articles[index].author,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Text(
                    'News',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('| '),
                  Text(
                    articles[index].DateFormatting(articles[index].createdAt),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
