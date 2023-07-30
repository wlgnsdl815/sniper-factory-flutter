import 'package:flutter/material.dart';

class HeartIcon extends StatefulWidget {
  const HeartIcon({super.key});

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool isLiked = false;

  void onHeartTap() async {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onHeartTap();
      },
      child: Icon(
        Icons.favorite,
        color: isLiked ? Colors.red : Colors.grey,
      ),
    );
  }
}
