import 'package:day36/utils/routes.dart';
import 'package:day36/view/screens/admin_screen.dart';
import 'package:day36/view/screens/home_screen.dart';
import 'package:get/route_manager.dart';

class GetScreens {
  static final screens = [
    GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.admin, page: () => AdminScreen()),
  ];
}
