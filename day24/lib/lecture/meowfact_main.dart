// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class MeowFact {
  List<String> data;

  MeowFact({
    required this.data,
  });

  factory MeowFact.fromJson(Map<String, dynamic> json) {
    List<String> data = List<String>.from(json['data']);
    return MeowFact(
      data: data,
    );
  }
  @override
  String toString() {
    return 'MeowFact: $data';
  }
}

void main() async {
  Dio dio = Dio();
  String url = 'https://meowfacts.herokuapp.com';

  for (int i = 0; i < 10; i++) {
    Response<Map<String, dynamic>> response = await dio.get(url);

    if (response.statusCode == 200) {
      MeowFact fact1 = MeowFact.fromJson(response.data!);
      print(fact1);
    }
  }
}
