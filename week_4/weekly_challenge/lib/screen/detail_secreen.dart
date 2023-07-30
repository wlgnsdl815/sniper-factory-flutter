import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String images;
  final String tag;

  const DetailScreen({
    super.key,
    required this.images,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Center(
          child: Hero(
            // Hero의 태그를 넣어준다
            tag: tag,
            child: Image.network(
              images,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                    child: Text(
                  '이미지가 없어요 ㅠㅠ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
