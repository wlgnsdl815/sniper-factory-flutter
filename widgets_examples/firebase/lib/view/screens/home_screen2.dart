import 'package:day34/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen2 extends GetView<HomeController> {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundImage: controller.user!.photoURL != null
                          ? NetworkImage(controller.user!.photoURL!)
                          : null,
                    ),
                    Expanded(
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                                '혈액형: ${controller.profile?.bloodtype ?? 'null'}'),
                            Text('직업: ${controller.profile?.job ?? 'null'}'),
                            Text('mbti: ${controller.profile?.mbti ?? 'null'}'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ...controller.images.map((e) => Image.network(e)).toList(),
                TextButton(
                    onPressed: () async {
                      var picker = ImagePicker();
                      var res =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (res != null) {
                        controller.uploadImage(res);
                      }
                    },
                    child: Text('업로드'))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('edit/profile'),
        child: Icon(Icons.edit),
      ),
    );
  }
}
