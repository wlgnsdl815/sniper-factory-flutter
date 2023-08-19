// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:day33/controllers/secret_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecretScreen extends GetView<SecretController> {
  const SecretScreen({super.key});

  static const String route = '/secret';

  @override
  Widget build(BuildContext context) {
    controller.getSecret();
    TextStyle _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24.0,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: Text('뒤로가기'),
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/3683.jpg.webp'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7),
              BlendMode.darken,
            ),
          ),
        ),
        child: Obx(
          () => PageView.builder(
            itemCount: controller.getList.length,
            controller: controller.pageController,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      child: Image.asset('assets/images/cat.png'),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      controller.getList[index].secret,
                      style: _textStyle,
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      controller.getList[index].author == ''
                          ? '익명으로 작성되었습니다.'
                          : '작성자: ${controller.getList[index].author}',
                      style: _textStyle.copyWith(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
