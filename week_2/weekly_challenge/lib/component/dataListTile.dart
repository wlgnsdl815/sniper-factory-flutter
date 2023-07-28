// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DataListTile extends StatelessWidget {
  final String name;
  final String msg;
  final String url;

  const DataListTile({
    Key? key,
    required this.name,
    required this.msg,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(url),
        ),
        title: Text(name),
        subtitle: Text(msg),
        trailing: (name == '마이클' || name == '민석이') ? null : CustomTrailing(),
      ),
    );
  }
}

class CustomTrailing extends StatelessWidget {
  const CustomTrailing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.green, width: 2),
      ),
      width: 100,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '똥밟았네',
          ),
          Icon(
            Icons.play_arrow_outlined,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
