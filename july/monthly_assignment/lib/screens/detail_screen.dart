import 'package:flutter/material.dart';
import 'package:monthly_assignment/components/image_container.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailScreen extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String content;
  final String author;
  final String articleUrl;
  final String heroTag;

  const DetailScreen({
    super.key,
    required this.imgUrl,
    required this.content,
    required this.title,
    required this.author,
    required this.articleUrl,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Hero(
                    tag: heroTag,
                    child: ImageContainer(imgUrl: imgUrl),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'by $author',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          launchUrlString(articleUrl);
                        },
                        child: Text('Full Article'),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(content),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }
}
