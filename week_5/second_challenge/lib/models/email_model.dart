// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class Email {
  String detail;
  int emailNo;
  String from;
  DateTime sendDate;
  String title;

  Email({
    required this.detail,
    required this.emailNo,
    required this.from,
    required this.sendDate,
    required this.title,
  });

  factory Email.fromJson(Map<String, dynamic> json) {
    DateFormat dateFormat = DateFormat("yyyy.MM.dd");

    return Email(
      detail: json['detail'],
      emailNo: json['emailNo'],
      from: json['from'],
      sendDate: dateFormat.parse(json['sendDate']),
      title: json['title'],
    );
  }
}

String formatDate(DateTime date) {
  final today = DateTime.now();

  if (date.day == today.day) {
    return '오늘';
  }
  if (date.day == today.day - 1) {
    return '어제';
  }
  if (date.year == today.year) {
    return DateFormat('MM.dd').format(date);
  } else {
    return DateFormat('yyyy.MM.dd').format(date);
  }
}
