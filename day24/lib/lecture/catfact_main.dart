// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class CatFact {
  String fact;
  int length;

  CatFact({
    required this.fact,
    required this.length,
  });

  factory CatFact.fromJson(Map<String, dynamic> json) => CatFact(
        fact: json['fact'],
        length: json['length'],
      );

  @override
  String toString() => 'CatFact: (fact: $fact, length: $length)';
}

void main() async {
  try {
    Dio dio = Dio();
    String url = 'https://catfact.ninja/fact';
    Response<Map<String, dynamic>> response = await dio.get(url);
    if (response.statusCode == 200) {
      CatFact result = CatFact.fromJson(response.data!);
      print(result);
    }
  } catch (e) {
    throw Exception(e);
  }
}
