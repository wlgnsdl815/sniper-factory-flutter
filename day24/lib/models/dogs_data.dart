// ignore_for_file: public_member_api_docs, sort_constructors_first
class Dogs {
  String message;
  String status;

  Dogs({
    required this.message,
    required this.status,
  });

  factory Dogs.fromMap(Map<String, dynamic> map) => Dogs(
        message: map['message'],
        status: map['status'],
      );
}
