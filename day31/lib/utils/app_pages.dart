import 'package:day31/pages/detail_page.dart';
import 'package:day31/pages/main_page.dart';
import 'package:day31/utils/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final appPages = [
    GetPage(
      name: AppRoutes.main,
      page: () => MainPage(),
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => DetailPage(),
    ),
  ];
}
