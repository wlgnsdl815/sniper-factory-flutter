import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weekly_assessment/models/item_model.dart';

class RestaurantService {
  Future<List<Item>> getData() async {
    try {
      Dio dio = Dio();
      Response resp = await dio.get(
        'http://apis.data.go.kr/6260000/FoodService/getFoodKr?serviceKey=mNJnf3ilbQOpYA70ByDce1j4lkvdkk%2FoaJqvptZBtjYhLea5zKdcUcaBKrW6gf5hgiqQqVq20fpkV6GdydzajA%3D%3D&resultType=json',
      );
      if (resp.statusCode == 200) {
        var itemList = List<Map<String, dynamic>>.from(
            jsonDecode(resp.data)['getFoodKr']['item']);
        print(itemList.map((e) => Item.fromJson(e)).toList().length);
        return itemList.map((e) => Item.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
