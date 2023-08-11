import 'package:day28/models/dictionary_model.dart';
import 'package:dio/dio.dart';

class DictionaryService {
  Future<List<Dictionary>> getData(String word) async {
    try {
      Dio dio = Dio();
      var url = 'https://api.dictionaryapi.dev/api/v2/entries/en/';

      Response response = await dio.get(url + word);
      if (response.statusCode == 200) {
        var data = List<Map<String, dynamic>>.from(response.data);
        List<Dictionary> dataList =
            data.map((e) => Dictionary.fromJson(e)).toList();

        return dataList;
      }

      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
