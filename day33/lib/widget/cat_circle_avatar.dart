import 'package:flutter/material.dart';

class CatCircleAvatar extends StatelessWidget {
  const CatCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 50.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          'assets/images/cat.png',
        ),
      ),
    );
  }
}
