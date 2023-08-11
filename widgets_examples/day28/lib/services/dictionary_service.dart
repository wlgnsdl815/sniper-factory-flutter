import 'package:day28/models/dictionary_model.dart';
import 'package:dio/dio.dart';

class DictionaryService {
  getData() async {
    try {
      Dio dio = Dio();
      var url = 'https://api.dictionaryapi.dev/api/v2/entries/en/';

      Response response = await dio.get(url + 'pioneer');
      if (response.statusCode == 200) {
        var dict = Dictionary.fromJson(response.data.first);
        print(dict);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
