// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String foodName;
  final String imgUrl;
  const OptionCard({
    super.key,
    required this.foodName,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text(foodName),
          Text('[담기]'),
        ],
      ),
    );
  }
}
