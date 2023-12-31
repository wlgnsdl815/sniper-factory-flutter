import 'package:day33/controllers/auth_controller.dart';
import 'package:day33/controllers/login_controller.dart';
import 'package:day33/controllers/secret_controller.dart';
import 'package:day33/controllers/setting_controller.dart';
import 'package:day33/controllers/signup_controller.dart';
import 'package:day33/controllers/upload_controller.dart';
import 'package:day33/styles/colors.dart';
import 'package:day33/utils/app_screens.dart';
import 'package:day33/utils/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());

        Get.lazyPut(() => LoginController(), fenix: true);
        Get.lazyPut(() => SignupController(), fenix: true);
        Get.lazyPut(() => SecretController(), fenix: true);
        Get.lazyPut(() => UploadController(), fenix: true);
        Get.lazyPut(() => SettingController());
      }),
      getPages: AppScreens.screens,
      theme: ThemeData(
        fontFamily: 'Neo',
        scaffoldBackgroundColor: backgroundColor,
      ),
      initialRoute: ScreenRoutes.login,
    );
  }
}
