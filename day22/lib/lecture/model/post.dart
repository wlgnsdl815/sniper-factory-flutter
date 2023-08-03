// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:day22/lecture/model/comment.dart';

class Post {
  // 클래스 멤버 변수
  String symbolImg;
  String title;
  DateTime createdAt;
  Duration? readTime;
  String thumbnailImg;
  int? upCount;
  List<Comment> comments;

  // 클래스 생성자
  Post({
    required this.symbolImg,
    required this.title,
    required this.createdAt,
    required this.readTime,
    required this.thumbnailImg,
    this.upCount,
    required this.comments,
  });

  // 클래스 메소드
  addUpCount() {
    if (upCount != null) {
      upCount = upCount! + 1;
    } else {
      upCount = 1;
    }
  }

  addComment(Comment comment) {
    comments.add(comment);
  }
}
