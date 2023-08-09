import 'package:day26/models/todo_model.dart';
import 'package:dio/dio.dart';

class TodoService {
  Future<List<Todo>> getData() async {
    try {
      Dio dio = Dio();

      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/todos');
      if (response.statusCode == 200) {
        var data = List<Map<String, dynamic>>.from(response.data);
        return data.map((e) => Todo.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
