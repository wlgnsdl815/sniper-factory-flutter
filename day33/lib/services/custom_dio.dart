import 'package:day33/utils/api_routes.dart';
import 'package:dio/dio.dart';

class CustomDio {
  // CustomDio 타입의 변수 _instance. Private하게 설정
  static final CustomDio _instance = CustomDio._internal();
  // Dio 객체를 저장하기 위한 변수를 선언.
  //late 키워드는 변수가 나중에 초기화될 것임을 나타낸다.
  //생성자에서 초기화.
  late Dio dio;

  //factory 생성자는 항상 동일한 _instance를 반환한다.
  factory CustomDio() {
    return _instance;
  }
  // Singleton 패턴을 구현하기 위한 _internal()
  CustomDio._internal() {
    // dio 초기화
    dio = Dio();
    dio.options.baseUrl = ApiRoutes.baseUrl;
  }
}
