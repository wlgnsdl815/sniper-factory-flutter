import 'package:get/get.dart';
import 'package:getx/controller/login_controller.dart';
import 'package:getx/view/screens/lecture_2/home_screen.dart';
import 'package:getx/view/screens/lecture_2/login_screen.dart';
import 'package:getx/view/screens/lecture_3/lecture3_home_screen.dart';
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
    GetPage(
      name: AppRoutes.home3,
      page: () => HomeScreen3(),
    ),
  ];
}
