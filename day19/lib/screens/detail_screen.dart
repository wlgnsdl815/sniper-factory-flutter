import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String imgUrl;
  final String heroTag;
  const DetailScreen({
    super.key,
    required this.imgUrl,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Hero(
          tag: heroTag,
          child: Center(
            child: Image.network(imgUrl),
          ),
        ),
      ),
    );
  }
}
