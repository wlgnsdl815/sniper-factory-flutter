// ignore_for_file: prefer_const_constructors

import 'package:day33/styles/text_styles.dart';
import 'package:day33/utils/screen_routes.dart';
import 'package:day33/widget/cat_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('수많은 비밀을 알고 있는'),
            Text(
              '비밀 듣는 고양이',
              style: CustomTextStyle.title,
            ),
            SizedBox(height: 20),
            CatCircleAvatar(),
            SizedBox(height: 20),
            _CustomListTile(
              title: '비밀 보기',
              subtitle: '오늘의 비밀을 확인하세요',
              route: ScreenRoutes.secret,
            ),
            SizedBox(height: 20),
            _CustomListTile(
              title: '비밀 만들기',
              subtitle: '비밀을 만들어보세요',
              route: ScreenRoutes.upload,
            ),
            SizedBox(height: 20),
            _CustomListTile(
              title: '설정',
              subtitle: '비밀 듣는 고양이',
              route: ScreenRoutes.setting,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String route;
  const _CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(route),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ListTile(
          tileColor: Colors.white,
          title: Text(
            title,
            style: CustomTextStyle.title,
          ),
          subtitle: Text(
            subtitle,
            style: CustomTextStyle.content,
          ),
          trailing: Image.asset(
            'assets/images/footprint.png',
            scale: 15,
          ),
        ),
      ),
    );
  }
}
