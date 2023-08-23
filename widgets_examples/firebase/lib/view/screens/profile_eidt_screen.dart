import 'package:day34/controllers/profile_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditPage extends GetView<ProfileEditController> {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('프로필 수정 및 추가'),
              DropdownButton(
                value: controller.job.value,
                items: ['개발자', '디자이너', '기획자', '마케터']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: controller.job,
                hint: Text('직업을 선택하세요'),
              ),
              DropdownButton(
                value: controller.bloodtype.value,
                items: ['A', 'B', 'AB', 'O']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: controller.bloodtype,
                hint: Text('혈액형을 선택하세요'),
              ),
              DropdownButton(
                value: controller.mbti.value,
                items: ['ISTJ', 'ISFJ', 'ISTP', 'INTP']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: controller.mbti,
                hint: Text('MBTI를 선택하세요'),
              ),
              TextButton(
                onPressed: controller.updateProfile,
                child: Text('적용하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
