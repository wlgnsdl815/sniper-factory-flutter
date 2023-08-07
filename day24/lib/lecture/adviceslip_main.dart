// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

class AdviceSlip {
  int id;
  String advice;

  AdviceSlip({
    required this.id,
    required this.advice,
  });

  factory AdviceSlip.fromJson(Map<String, dynamic> json) {
    return AdviceSlip(
      id: json['id'],
      advice: json['advice'],
    );
  }

  @override
  String toString() => 'AdviceSlip: (id: $id, advice: $advice)';
}

void main() async {
  try {
    Dio dio = Dio();
    String url = 'https://api.adviceslip.com/advice';
    var resp = await dio.get(url);
    if (resp.statusCode == 200) {
      var myData = jsonDecode(resp.data);
      AdviceSlip slipData = AdviceSlip.fromJson(myData['slip']);
      print(slipData);
    }
  } catch (e) {
    throw Exception(e);
  }
}
