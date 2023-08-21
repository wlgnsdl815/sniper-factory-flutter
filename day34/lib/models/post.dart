// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Post {
  String? id;
  String title;
  String content;
  int likes;
  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.likes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'likes': likes,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as String?,
      title: map['title'] as String,
      content: map['content'] as String,
      likes: map['likes'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);
}
