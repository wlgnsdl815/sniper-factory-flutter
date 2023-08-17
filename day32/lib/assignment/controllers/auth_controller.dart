import 'package:day32/assignment/models/user_model.dart';
import 'package:day32/assignment/services/user_service.dart';
import 'package:day32/assignment/utils/app_routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();

  User? get user => _user.value;

  setUser(User user) {
    _user(user);
    print(_user);
  }

  _handleAuthChanged(User? userData) {
    print('curdata: $userData');
    if (userData != null) {
      Get.toNamed(AppRoutes.main);
      return;
    }
    Get.toNamed(AppRoutes.login);
    return;
  }

  login(String id, String pw) {
    UserService().getData(id, pw);
    // print(_user);
  }

  logout() {
    _user.value = null;
  }

  @override
  void onInit() {
    super.onInit();
    print('onInit: $_user');
    ever(_user, _handleAuthChanged);
  }
}
