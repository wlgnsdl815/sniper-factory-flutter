import 'package:day35/controllers/auth_controller.dart';
import 'package:day35/controllers/home_controller.dart';
import 'package:day35/controllers/login_controller.dart';
import 'package:day35/firebase_options.dart';
import 'package:day35/utils/screens.dart';
import 'package:day35/view/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        Get.lazyPut(() => HomeController());
      }),
      getPages: Screens.screens,
      theme: ThemeData(useMaterial3: true),
      initialRoute: LoginScreen.route,
    );
  }
}
