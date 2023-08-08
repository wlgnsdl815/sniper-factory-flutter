import 'package:dio/dio.dart';
import 'package:weekly_challenge/models/email_model.dart';

class EmailService {
  Dio dio = Dio();

  Future<List<Email>> getData() async {
    try {
      Dio dio = Dio();
      Response<dynamic> resp = await dio.get(
        'https://sfacassignmentchallenge-default-rtdb.europe-west1.firebasedatabase.app/.json',
      );
      var data = List<Map<String, dynamic>>.from(resp.data['emails']);
      print(data.map((e) => Email.fromJson(e)).toList());
      return data.map((e) => Email.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
