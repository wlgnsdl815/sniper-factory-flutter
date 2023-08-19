import 'package:day33/controllers/auth_controller.dart';
import 'package:day33/controllers/login_controller.dart';
import 'package:day33/controllers/upload_controller.dart';
import 'package:day33/models/user_model.dart';
import 'package:day33/services/custom_dio.dart';
import 'package:day33/utils/api_routes.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  var authController = Get.find<AuthController>();
  var loginController = Get.find<LoginController>();
  // Singleton으로부터 Dio 인스턴스를 가져오기
  var dio = CustomDio().dio;

  getUserList() async {
    try {
      var response = await dio.get(ApiRoutes.readUserList);
      if (response.statusCode == 200) {
        List dataList = response.data['items'];
        dataList.map((e) => User.fromMap(e)).toList();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // - identity (String - required)
  // - password (String -required, 9글자 이상)
  postLogin({required String id, required String pw}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var res = await dio.post(
        ApiRoutes.login,
        data: {
          'identity': id,
          'password': pw,
        },
      );

      String token = res.data['token'];

      if (loginController.isChecked) {
        prefs.setString('token', token);
        authController.setToken(token);
      }
      User user = User.fromMap(res.data['record']);
      // log('${user}', name: 'user');
      // log('${res.data['record']}', name: 'res');

      Get.find<UploadController>().setAuthor(user.id, user.username);
      authController.setUser(user);
    } catch (e) {
      throw Exception(e);
    }
  }

  // - email (String - required, 올바른 이메일형식일 것)
  // - password (String - required, 9자 이상일 것)
  // - passwordConfirm (String - required, 9자 이상일 것)
  // - username (String)
  postSignup({
    required String email,
    required String pw,
    required String pw2,
    String? name,
  }) async {
    // 이메일 정규식
    final RegExp regex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (regex.hasMatch(email) && pw.length >= 9 && pw == pw2) {
      try {
        var res = await dio.post(ApiRoutes.signup, data: {
          "email": email,
          "password": pw,
          "passwordConfirm": pw2,
          "username": name,
        });
        print('회원가입 성공: $res');
      } catch (e) {
        if (e is DioException) {
          print("Dio error: ${e.response?.data}");
        }
        throw Exception(e);
      }
    }
    return;
  }

  postRefresh() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    try {
      var resp = await dio.post(
        ApiRoutes.refresh,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      var user = User.fromMap(resp.data['record']);
      authController.setUser(user);
      print('refresh 성공! $token');
    } catch (e) {
      throw Exception(e);
    }
  }
}
