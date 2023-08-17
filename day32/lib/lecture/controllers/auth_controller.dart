import 'package:day32/lecture/models/user.dart';
import 'package:day32/lecture/utils/api_routes.dart';
import 'package:day32/lecture/view/lgoin_page.dart';
import 'package:day32/lecture/view/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  Dio dio = Dio();

  User? get user => _user.value;

  _handleAuthChanged(User? data) {
    print('curdata: $data');
    if (data != null) {
      // Get.to
      // 메인페이지로 이동
      Get.toNamed(MainPage.route);
      return;
    }
    // 로그인페이지로 이동
    Get.toNamed(LoginPage.route);
    return;
  }

  login(String id, String pw) async {
    dio.options.baseUrl = 'http://52.79.115.43:8090';

    try {
      var res = await dio.post(
        'http://52.79.115.43:8090${ApiRoutes.authWithPassword}',
        data: {
          'identity': id,
          'password': pw,
        },
      );
      if (res.statusCode == 200) {
        print(res.data['record']);
        var user = User.fromMap(res.data['record']);
        _user(user);
      }
    } on DioExceptionType catch (e) {
      print(e);
    }
  }

  logout() {
    _user.value = null;
    _user(null);
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
