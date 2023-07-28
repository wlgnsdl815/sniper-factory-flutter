// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:day6/component/contact_component/contactTile.dart';
import 'package:flutter/material.dart';

class MainContactScreen extends StatelessWidget {
  const MainContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ContactTile(
            name: '이테디',
            phone: '010-1000-2000',
            imgUrl: 'https://picsum.photos/100/100',
          ),
          ContactTile(
            name: '밀리',
            phone: '010-1000-2000',
            imgUrl: 'https://picsum.photos/95/95',
          ),
          ContactTile(
            name: '크리스',
            phone: '010-1000-2000',
            imgUrl: 'https://picsum.photos/90/90',
          ),
          ContactTile(
            name: '주노',
            phone: '010-1000-2000',
            imgUrl: 'https://picsum.photos/85/85',
          ),
          ContactTile(
            name: '해리',
            phone: '010-1000-2000',
            imgUrl: 'https://picsum.photos/80/80',
          ),
          ContactTile(
            name: '벨라',
            phone: '010-1000-2000',
            imgUrl: 'https://picsum.photos/75/75',
          ),
          ContactTile(
            name: '헬렌',
            phone: '010-1000-2000',
            imgUrl: 'https://picsum.photos/70/70',
          ),
        ],
      ),
    );
  }
}
