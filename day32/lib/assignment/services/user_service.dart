import 'package:day32/assignment/controllers/auth_controller.dart';
import 'package:day32/assignment/models/user_model.dart';
import 'package:day32/assignment/utils/api_routes.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserService {
  getData(String id, String pw) async {
    try {
      Dio dio = Dio();
      dio.options.baseUrl = ApiRoutes.baseUrl;
      var response = await dio.post(
        ApiRoutes.authWithPassword,
        data: {
          'identity': id,
          'password': pw,
        },
      );
      if (response.statusCode == 200) {
        String token = response.data['token'];
        User user = User.fromMap(response.data['record']);

        Get.find<AuthController>().setToken(token);
        Get.find<AuthController>().setUser(user);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

// http://52.79.115.43:8090/api/collections/users/auth-with-password