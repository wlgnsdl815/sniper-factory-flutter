import 'package:day26/lecture/model/todo2_model.dart';
import 'package:dio/dio.dart';

class TodoService2 {
  Future<List<Todo2>> getData() async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get('https://jsonplaceholder.typicode.com/todos');
      if (response.statusCode == 200) {
        var data = List<Map<String, dynamic>>.from(response.data);
        print(data.map((e) => Todo2.fromJson(e)).toList());
        return data.map((e) => Todo2.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
