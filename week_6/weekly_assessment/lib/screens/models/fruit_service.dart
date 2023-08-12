import 'package:dio/dio.dart';
import 'package:weekly_assessment/screens/models/fruit_model.dart';

class FruitService {
  Future<List<Fruit>> getData() async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get('https://www.fruityvice.com/api/fruit/all');
      if (response.statusCode == 200) {
        var fruitDataList = List<Map<String, dynamic>>.from(response.data);
        return fruitDataList.map((e) => Fruit.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
