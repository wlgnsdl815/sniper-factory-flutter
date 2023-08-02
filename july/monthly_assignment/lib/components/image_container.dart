// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  Widget? child;
  EdgeInsetsGeometry? margin;
  ImageContainer({
    Key? key,
    this.child,
    this.margin,
    required this.imgUrl,
  }) : super(key: key);

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
            image: NetworkImage(imgUrl), opacity: 0.4, fit: BoxFit.cover),
        color: Colors.black,
      ),
      child: child,
    );
  }
}
