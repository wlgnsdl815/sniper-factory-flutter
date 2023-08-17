import 'package:day32/assignment/utils/app_routes.dart';
import 'package:day32/assignment/view/main_screen.dart';
import 'package:day32/assignment/view/login_screen.dart';

import 'package:get/get.dart';

class AppScreens {
  static final screens = [
    GetPage(name: AppRoutes.main, page: () => MainScreen()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),
  ];
}
