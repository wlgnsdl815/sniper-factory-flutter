import 'package:day32/assignment/controllers/auth_controller.dart';
import 'package:day32/assignment/controllers/main_controller.dart';
import 'package:day32/assignment/models/document_model.dart';
import 'package:day32/assignment/utils/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DocumentService {
  getData() async {
    var token = Get.find<AuthController>().token;
    if (token != null) {
      try {
        Dio dio = Dio();
        dio.options.baseUrl = ApiRoutes.baseUrl;
        var response = await dio.get(
          ApiRoutes.dataWithToken,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
        );
        if (response.statusCode == 200) {
          // print(response.data['items']);
          var itemsList =
              List<Map<String, dynamic>>.from(response.data['items']);
          List<Document> document =
              itemsList.map((e) => Document.fromMap(e)).toList();
          Get.find<MainController>().setDocument(document);
        }
      } catch (e) {
        throw Exception(e);
      }
    }
    return '토큰이 없습니다';
  }
}
