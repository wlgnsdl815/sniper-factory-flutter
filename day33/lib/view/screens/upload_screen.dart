import 'package:day33/controllers/upload_controller.dart';
import 'package:day33/styles/colors.dart';
import 'package:day33/styles/text_styles.dart';
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
    final _formKey = GlobalKey<FormState>();
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
            child: Form(
              key: _formKey,
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
                    isIdPw: false,
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
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.isChecked.value,
                          onChanged: (_) => controller.onCheckBoxTap(),
                          activeColor: textColor,
                        ),
                      ),
                      Text(
                        '내 이름 공개하기',
                        style: CustomTextStyle.content,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
