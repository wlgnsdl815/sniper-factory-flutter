// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:day6/component/contact_component/contactTile.dart';
import 'package:flutter/material.dart';

class ContactDetailScreen extends StatelessWidget {
  final String name;
  final String phone;
  final String imgUrl;
  const ContactDetailScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          title: Text('연락처 상세'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.cover),
            ),
          ),
          centerTitle: false,
          actions: [
            Icon(
              Icons.more_vert,
              color: Colors.black45,
            )
          ],
        ),
      ),
      body: ContactTile(
        name: name,
        phone: phone,
        icon: Icon(Icons.call),
        imgUrl: imgUrl,
      ),
    );
  }
}
