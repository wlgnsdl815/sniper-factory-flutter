import 'package:day33/controllers/auth_controller.dart';
import 'package:day33/controllers/setting_controller.dart';
import 'package:day33/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  static const String route = '/setting';

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().user.value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      user.username,
                      style: CustomTextStyle.title,
                    ),
                    subtitle: Text(
                      '안녕하세요',
                      style: CustomTextStyle.content,
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: Text(
                        user.username[0],
                        style: CustomTextStyle.content,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                ListTile(
                  onTap: () => controller.logout(),
                  title: Text(
                    '로그아웃',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  subtitle: Text(
                    '오늘의 비밀을 확인하세요',
                    style: CustomTextStyle.content,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
