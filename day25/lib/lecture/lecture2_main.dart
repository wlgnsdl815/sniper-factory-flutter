// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  @override
  String toString() {
    return 'Post: $body | $title';
  }
}

Future<Post?> getData(int userId) async {
  try {
    Dio dio = Dio();
    Response response =
        await dio.get('https://jsonplaceholder.typicode.com/posts$userId');
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    }
    return null;
  } catch (e) {
    throw Exception(e);
  }
}

Future<List<Post>> readData() async {
  try {
    Dio dio = Dio();
    Response response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(response.data);
      return data.map((e) => Post.fromJson(e)).toList();
    }
    return [];
  } catch (e) {
    throw Exception(e);
  }
}

void main() async {
  var res = await readData();
  print(res);
  print(res.length);
}
