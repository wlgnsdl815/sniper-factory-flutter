// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

class AdviceSlip {
  Map<String, dynamic> slip;

  AdviceSlip({
    required this.slip,
  });

  int get id => slip['id'];
  String get advice => slip['advice'];

  factory AdviceSlip.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> slipData = json['slip'];
    return AdviceSlip(
      slip: slipData,
    );
  }

  @override
  String toString() => 'AdviceSlip: (slip: $slip, id: $id, advice: $advice)';
}

void main() async {
  try {
    Dio dio = Dio();
    String url = 'https://api.adviceslip.com/advice';
    var resp = await dio.get(url);
    var result = AdviceSlip.fromJson(jsonDecode(resp.data));
    print(result);
  } catch (e) {
    throw Exception(e);
  }
}
