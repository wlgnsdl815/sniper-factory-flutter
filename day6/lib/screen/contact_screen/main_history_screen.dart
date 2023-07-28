// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:day6/component/contact_component/contactTile.dart';
import 'package:flutter/material.dart';

class MainHistoryScreen extends StatelessWidget {
  const MainHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ContactTile(
            name: '이테디',
            icon: Icon(Icons.north_east),
          ),
          ContactTile(
            name: '이테디',
            icon: Icon(Icons.call_missed),
          ),
          ContactTile(
            name: '이테디',
            icon: Icon(Icons.call_missed),
          ),
          ContactTile(
            name: '이테디',
            icon: Icon(Icons.north_east),
          ),
          ContactTile(
            name: '이테디',
            icon: Icon(Icons.call_missed),
          ),
          ContactTile(
            name: '이테디',
            icon: Icon(Icons.north_east),
          ),
          ContactTile(
            name: '이테디',
            icon: Icon(Icons.call_missed),
          ),
          ContactTile(
            name: '이테디',
            icon: Icon(Icons.call_missed),
          ),
        ],
      ),
    );
  }
}
