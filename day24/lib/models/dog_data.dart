// ignore_for_file: public_member_api_docs, sort_constructors_first
class Dog {
  String message;
  String status;

  Dog({
    required this.message,
    required this.status,
  });

  factory Dog.fromMap(Map<String, dynamic> map) => Dog(
        message: map['message'],
        status: map['status'],
      );
}
