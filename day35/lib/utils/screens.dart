import 'package:day35/utils/routes.dart';
import 'package:day35/view/screens/home_screen.dart';
import 'package:day35/view/screens/login_screen.dart';
import 'package:get/get.dart';

class Screens {
  static final screens = [
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
    ),
  ];
}
