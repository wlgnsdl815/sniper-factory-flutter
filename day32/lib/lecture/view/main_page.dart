// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:day32/lecture/controllers/auth_controller.dart';
import 'package:day32/lecture/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().user!;
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.curPage.value,
          onTap: controller.onPageTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
          ],
        ),
      ),
      body: SafeArea(
        child: PageView(
          key: UniqueKey(),
          controller: controller.pageController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.username}님 안녕하세요',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(),
                  title: Text(user.username),
                  subtitle: Text(user.name),
                ),
                ListTile(
                  title: Text('로그아웃하기'),
                  leading: Icon(Icons.logout),
                  onTap: controller.logout,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
