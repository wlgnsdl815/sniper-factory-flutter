import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:widgets_examples/riverpod/models/user_model.dart';

class UserService {
  getUsers() async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/users');
      List<dynamic> data = response.data;
      log(name: 'data', '$data');
      return data.map((user) => User.fromJson(user)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
