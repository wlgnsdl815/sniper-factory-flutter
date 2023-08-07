// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class BoredApi {
  String activity;
  String type;
  int participants;
  double price;
  String? link;
  String key;
  double accessibility;

  BoredApi({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    this.link,
    required this.key,
    required this.accessibility,
  });

  factory BoredApi.fromJson(Map<String, dynamic> json) {
    return BoredApi(
      activity: json['activity'],
      type: json['type'],
      participants: json['participants'],
      price: json['price'] is int
          ? double.parse(json['price'].toString())
          : json['price'],
      link: json['link'] ?? '',
      key: json['key'],
      accessibility: json['accessibility'],
    );
  }
  @override
  String toString() =>
      'BoredApi: (activity: $activity, type: $type, participants: $participants, price: $price, link: $link,key: $key, accessibility: $accessibility)';
}

void main() async {
  try {
    Dio dio = Dio();
    String url = 'https://www.boredapi.com/api/activity';
    Response<Map<String, dynamic>> response = await dio.get(url);
    if (response.statusCode == 200) {
      print(response.data!['price'].runtimeType);

      BoredApi result = BoredApi.fromJson(response.data!);
      print(result);
    }
  } catch (e) {
    throw Exception(e);
  }
}
