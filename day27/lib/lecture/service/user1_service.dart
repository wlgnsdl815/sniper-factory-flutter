import 'package:day27/lecture/models/user1_model.dart';
import 'package:dio/dio.dart';

class User1Service {
  getData() async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/users/1');

      if (response.statusCode == 200) {
        var user = User1.fromJson(response.data);
        print(user.company.name);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
