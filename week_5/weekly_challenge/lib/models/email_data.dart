// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmailData {
  String detail;
  int emailNo;
  String from;
  String sendDate;
  String title;

  EmailData({
    required this.detail,
    required this.emailNo,
    required this.from,
    required this.sendDate,
    required this.title,
  });

  factory EmailData.fromJson(Map<String, dynamic> json) => EmailData(
        detail: json['detail'],
        emailNo: json['emailNo'],
        from: json['from'],
        sendDate: json['sendDate'],
        title: json['title'],
      );
}
