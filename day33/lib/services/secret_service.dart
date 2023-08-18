import 'package:day33/controllers/secret_controller.dart';
import 'package:day33/models/secret_model.dart';
import 'package:day33/utils/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SecretService {
  getSecretList() async {
    try {
      Dio dio = Dio();
      dio.options.baseUrl = ApiRoutes.baseUrl;
      var res = await dio.get(ApiRoutes.readSecrets);
      if (res.statusCode == 200) {
        var itemList = List<Map<String, dynamic>>.from(res.data['items']);
        List<Secret> secretList =
            itemList.map((e) => Secret.fromMap(e)).toList();
        Get.find<SecretController>().setList(secretList);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  postUploadSecret(String secret, String? author, String? authorName) async {
    try {
      Dio dio = Dio();
      dio.options.baseUrl = ApiRoutes.baseUrl;
      var res = await dio.post(
        ApiRoutes.upload,
        data: {
          'secret': secret,
          'author': author,
          'authorName': authorName,
        },
      );
      if (res.statusCode == 200) {}
    } catch (e) {
      throw Exception(e);
    }
  }
}
