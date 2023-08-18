import 'package:day33/controllers/upload_controller.dart';
import 'package:day33/utils/screen_routes.dart';
import 'package:day33/widget/custom_elevated_button.dart';
import 'package:day33/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadScreen extends GetView<UploadController> {
  const UploadScreen({super.key});

  static const String route = '/upload';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/cat.png'),
                ),
                CustomTextField(
                  controller: controller.secretController,
                  hintText: '비밀을 입력하세요',
                  maxLines: 18,
                  isEmail: false,
                ),
                SizedBox(height: 10),
                CustomElevatedButton(
                  title: '업로드',
                  onPressed: () {
                    controller.upload();
                    Get.snackbar('비밀이 업로드 되었습니다!', '어서 확인해보세요!');
                    Get.toNamed(ScreenRoutes.home);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
