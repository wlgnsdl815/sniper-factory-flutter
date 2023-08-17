import 'package:get/get.dart';
import 'package:getx/models/user_model.dart';
import 'package:getx/view/screens/lecture_2/home_screen.dart';
import 'package:getx/view/screens/lecture_2/login_screen.dart';

class GlobalDataController2 extends GetxController {
  Rxn<User> user = Rxn();

  @override
  void onInit() {
    print('컨트롤러가 생성됨');
    super.onInit();
    ever(user, (value) {
      print('에버 실행됨 $user');
      if (value == null) {
        Get.to(() => HomeScreen());
        return;
      }
      Get.to(() => LoginScreen());
      return;
    });
  }
}
