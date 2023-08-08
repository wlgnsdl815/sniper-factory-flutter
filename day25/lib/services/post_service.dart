import 'package:day25/models/post_model.dart';
import 'package:dio/dio.dart';

// dio를 사용해서 api를 가져오고 Future<List<Post>> 를 돌려준다.
class PostService {
  Dio dio = Dio();

  Future<List<Post>> getData() async {
    Response response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(response.data);
      return data.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('데이터 가져오기 실패');
    }
  }
}
