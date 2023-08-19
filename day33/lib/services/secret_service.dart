import 'package:day33/controllers/secret_controller.dart';
import 'package:day33/models/secret_model.dart';
import 'package:day33/services/custom_dio.dart';
import 'package:day33/utils/api_routes.dart';
import 'package:get/get.dart';

class SecretService {
  var dio = CustomDio().dio;
  getSecretList() async {
    try {
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

  postUploadSecret({
    required String secret,
    required String? author,
    required String? authorName,
  }) async {
    try {
      await dio.post(
        ApiRoutes.upload,
        data: {
          'secret': secret,
          'author': author,
          'authorName': authorName,
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
