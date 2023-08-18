import 'package:day33/models/user_model.dart';
import 'package:day33/services/user_service.dart';
import 'package:day33/utils/screen_routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();

  _handleAuthChanged(User? user) {
    if (user != null) {
      Get.toNamed(ScreenRoutes.home);
      return;
    }
    Get.toNamed(ScreenRoutes.login);
    return;
  }

  login(String id, String pw) {
    UserService().postLogin(id, pw);
  }

  logout() {
    _user(null);
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
