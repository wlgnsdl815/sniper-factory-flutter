import 'package:day27/models/user_models.dart';
import 'package:dio/dio.dart';

class UserService {
  Future<List<User>> getData() async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/users');
      if (response.statusCode == 200) {
        var dataList = List<Map<String, dynamic>>.from(response.data);
        List<User> userList = dataList.map((e) => User.fromJson(e)).toList();
        return userList;
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
