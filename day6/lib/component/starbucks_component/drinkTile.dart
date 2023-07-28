// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class DrinkTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final int price;
  final String imgUrl;

  const DrinkTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundImage: AssetImage(
              imgUrl,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style:
                    TextStyle(fontWeight: FontWeight.w200, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                '$price원',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
