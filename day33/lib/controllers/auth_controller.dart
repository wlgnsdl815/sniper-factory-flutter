import 'package:day33/controllers/login_controller.dart';
import 'package:day33/models/user_model.dart';
import 'package:day33/services/user_service.dart';
import 'package:day33/utils/screen_routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rxn<User> _user = Rxn();

  get user => _user;

  setUser(User user) {
    _user(user);
  }

  _handleAuthChanged(User? user) {
    if (user != null) {
      Get.toNamed(ScreenRoutes.home);
      return;
    }

    Get.toNamed(ScreenRoutes.login);
    return;
  }

  login(String id, String pw) {
    UserService().postLogin(
      id: id,
      pw: pw,
    );
  }

  logout() {
    Get.find<LoginController>().idController.clear();
    Get.find<LoginController>().pwController.clear();
    _user.value = null;
    print(_user);
    Get.snackbar('Logout 되었습니다.', '다음에 또 봬요!');
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
