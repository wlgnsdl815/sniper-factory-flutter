// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:day32/assignment/controllers/auth_controller.dart';
import 'package:day32/assignment/controllers/main_controller.dart';
import 'package:day32/assignment/models/document_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().user!;
    RxList<Document> doc = controller.doc;
    return Scaffold(
      body: SafeArea(
        child: PageView(
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
                SizedBox(height: 10),
                Obx(
                  () => Column(
                    children: [
                      ...doc.asMap().entries.map(
                        (e) {
                          if (e.key == 3) {
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(e.value.title),
                                  subtitle: Text(e.value.content),
                                ),
                                Image.network(e.value.attachment_url!),
                              ],
                            );
                          }
                          return ListTile(
                            title: Text(e.value.title),
                            subtitle: Text(e.value.content),
                          );
                        },
                      ),
                    ],
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
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentScreen.value,
          onTap: controller.onPageTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.readDocuments,
        child: Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}
