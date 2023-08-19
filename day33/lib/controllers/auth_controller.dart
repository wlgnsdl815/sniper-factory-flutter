import 'package:day33/controllers/login_controller.dart';
import 'package:day33/models/user_model.dart';
import 'package:day33/services/user_service.dart';
import 'package:day33/utils/screen_routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  final Rxn _token = Rxn();

  get user => _user;

  get token => _token;

  setUser(User user) {
    _user(user);
  }

  setToken(String token) {
    _token(token);
    print(_token);
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
    var loginController = Get.find<LoginController>();
    loginController.idController.clear();
    loginController.pwController.clear();
    loginController.onCheckBoxPressed();
    _user.value = null;
    Get.snackbar('Logout 되었습니다.', '다음에 또 봬요!');
  }

  checkToken() {}

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
