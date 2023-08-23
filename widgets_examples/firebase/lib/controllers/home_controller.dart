import 'dart:io';

import 'package:day34/models/profile_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import 'auth_controller.dart';

class HomeController extends GetxController {
  final RxList images = [].obs;

  User? get user => Get.find<AuthController>().user.value;
  Profile? get profile => Get.find<AuthController>().profile.value;

  // 이미지 다운로드
  fetchImages() async {
    var ref = FirebaseStorage.instance.ref('/images');
    var res = await ref.listAll();
    images.clear();
    for (var item in res.items) {
      // getDownloadURL() 함수는 future를 리턴해주기 때문에 await
      var url = await item.getDownloadURL();
      // 컨트롤러에 선언한 final RxList images = [].obs;의 images에 추가한다
      images.add(url);
    }
  }

  // 이미지 업로드
  uploadImage(XFile file) {
    var ref = FirebaseStorage.instance.ref('/images/${file.name}');
    ref.putFile(File(file.path)).then((p0) {
      fetchImages();
    });
  }
}
