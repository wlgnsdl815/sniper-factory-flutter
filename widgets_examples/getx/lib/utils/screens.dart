import 'package:get/get.dart';
import 'package:getx/screens/lecture_2/home_screen.dart';
import 'package:getx/screens/lecture_2/login_screen.dart';
import 'package:getx/utils/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
  ];
}
