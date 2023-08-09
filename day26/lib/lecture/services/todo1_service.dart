import 'package:day26/lecture/model/todo1_model.dart';
import 'package:dio/dio.dart';

class TodoService1 {
  Future<Todo1?> getData(int todoNumber) async {
    try {
      Dio dio = Dio();
      Response response = await dio
          .get('https://jsonplaceholder.typicode.com/todos/$todoNumber');
      if (response.statusCode == 200) {
        var data = Todo1.fromJson(response.data);
        print(data);
        return data;
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
