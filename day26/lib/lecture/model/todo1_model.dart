// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo1 {
  int userId;
  int id;
  String title;
  bool completed;

  Todo1({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo1.fromJson(Map<String, dynamic> json) => Todo1(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed'],
      );
}
