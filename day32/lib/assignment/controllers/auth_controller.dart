import 'package:day32/assignment/controllers/login_controller.dart';
import 'package:day32/assignment/models/user_model.dart';
import 'package:day32/assignment/services/user_service.dart';
import 'package:day32/assignment/utils/app_routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  String? _token;

  User? get user => _user.value;
  String? get token => _token;

  setUser(User user) {
    _user(user);
  }

  setToken(String token) {
    _token = token;
  }

  _handleAuthChanged(User? userData) {
    if (userData != null) {
      Get.toNamed(AppRoutes.main);
      return;
    }
    Get.toNamed(AppRoutes.login);
    return;
  }

  login(String id, String pw) {
    UserService().getData(id, pw);
  }

  logout() {
    _user.value = null;
    Get.find<LoginController>().idController.clear();
    Get.find<LoginController>().pwController.clear();
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
