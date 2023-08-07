// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

class Album {
  int userId;
  int id;
  String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
      );

  @override
  String toString() => 'Album: $userId, $id, $title';
}

void main() async {
  var response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );
  if (response.statusCode == 200) {
    print(response.body);
    var album = Album.fromJson(jsonDecode(response.body));
    print(album);
  }
}
