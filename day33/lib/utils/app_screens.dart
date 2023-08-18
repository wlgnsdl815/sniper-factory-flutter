import 'package:day33/utils/screen_routes.dart';
import 'package:day33/view/screens/home_screen.dart';
import 'package:day33/view/screens/login_screen.dart';
import 'package:day33/view/screens/secret_screen.dart';
import 'package:day33/view/screens/setting_screen.dart';
import 'package:day33/view/screens/signup_screen.dart';
import 'package:day33/view/screens/upload_screen.dart';
import 'package:get/get.dart';

class AppScreens {
  static final screens = [
    GetPage(name: ScreenRoutes.home, page: () => HomeScreen()),
    GetPage(name: ScreenRoutes.login, page: () => LoginScreen()),
    GetPage(name: ScreenRoutes.secret, page: () => SecretScreen()),
    GetPage(name: ScreenRoutes.setting, page: () => SettingScreen()),
    GetPage(name: ScreenRoutes.signup, page: () => SignupScreen()),
    GetPage(name: ScreenRoutes.upload, page: () => UploadScreen()),
  ];
}
