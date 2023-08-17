import 'package:get/get.dart';
import 'package:getx/view/screens/lecture_2/login_screen.dart';

class HomeController extends GetxController {
  toLogin() {
    Get.toNamed(LoginScreen.route);
  }
}
