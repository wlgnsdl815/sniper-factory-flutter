// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class EmailData {
  String detail;
  int emailNo;
  String from;
  DateTime sendDate;
  String title;

  EmailData({
    required this.detail,
    required this.emailNo,
    required this.from,
    required this.sendDate,
    required this.title,
  });

  factory EmailData.fromJson(Map<String, dynamic> json) {
    DateFormat dateFormat = DateFormat("yyyy.MM.dd"); // Define your date format

    return EmailData(
        detail: json['detail'],
        emailNo: json['emailNo'],
        from: json['from'],
        sendDate: dateFormat.parse(json['sendDate']),
        title: json['title']);
  }

  String DateFormatting(DateTime date) {
    if (date.day == DateTime.now().day) {
      return '오늘';
    }
    if (date.day == DateTime.now().day - 1) {
      return '어제';
    }
    if (date.year == DateTime.now().year) {
      return DateFormat('MM.dd').format(date);
    } else {
      return DateFormat('yyyy.MM.dd').format(date);
    }
  }
}
