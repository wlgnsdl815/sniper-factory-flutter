import 'package:day26/lecture/model/todo1_model.dart';
import 'package:dio/dio.dart';

class TodoService1 {
  getData() async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/todos/1');
      if (response.statusCode == 200) {
        var data = Todo1.fromJson(response.data);
        print(data);
        return data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
