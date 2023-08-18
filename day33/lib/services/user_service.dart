import 'package:day33/controllers/auth_controller.dart';
import 'package:day33/models/user_model.dart';
import 'package:day33/utils/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserService {
  getUserList() async {
    try {
      Dio dio = Dio();
      dio.options.baseUrl = ApiRoutes.baseUrl;
      var response = await dio.get(ApiRoutes.readUserList);
      if (response.statusCode == 200) {
        List dataList = response.data['items'];
        List<User> userList = dataList.map((e) => User.fromMap(e)).toList();
        // log('$userList', name: 'userList');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // - identity (String - required)
  // - password (String -required, 9글자 이상)
  postLogin(String id, String pw) async {
    try {
      Dio dio = Dio();
      dio.options.baseUrl = ApiRoutes.baseUrl;
      var res = await dio.post(
        ApiRoutes.login,
        data: {
          'identity': id,
          'password': pw,
        },
      );
      String token = res.data['token'];
      User user = User.fromMap(res.data['record']);
      // log('${user}', name: 'user');
      // log('${res.data['record']}', name: 'res');
      Get.find<AuthController>().setUser(user);
    } catch (e) {
      throw Exception(e);
    }
  }

  // - email (String - required, 올바른 이메일형식일 것)
  // - password (String - required, 9자 이상일 것)
  // - passwordConfirm (String - required, 9자 이상일 것)
  // - username (String)
  postSignup(String email, String pw, String pw2, String name) async {
    // 이메일 정규식
    final RegExp regex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (regex.hasMatch(email) && pw.length >= 9 && pw == pw2) {
      try {
        Dio dio = Dio();
        dio.options.baseUrl = ApiRoutes.baseUrl;
        var res = await dio.post(
          ApiRoutes.signup,
          data: {
            'email': email,
            'password': pw,
            'passwordConfirm': pw2,
            'username': name,
          },
        );
      } catch (e) {
        if (e is DioException) {
          print("Dio error: ${e.response?.data}");
        }
        throw Exception(e);
      }
    }
    return;
  }
}
