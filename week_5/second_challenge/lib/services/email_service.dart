import 'package:dio/dio.dart';
import 'package:second_challenge/models/email_model.dart';

class EmailService {
  Future<List<Email>> getData() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          'https://sfacassignmentchallenge-default-rtdb.europe-west1.firebasedatabase.app/.json');
      if (response.statusCode == 200) {
        var data = List<Map<String, dynamic>>.from(response.data['emails']);
        return data.map((e) => Email.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
