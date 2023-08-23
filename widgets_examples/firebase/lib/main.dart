import 'package:day34/controllers/auth_controller.dart';
import 'package:day34/controllers/home_controller.dart';
import 'package:day34/controllers/profile_edit_controller.dart';
import 'package:day34/firebase_options.dart';
import 'package:day34/view/screens/home_screen2.dart';
import 'package:day34/view/screens/login_screen.dart';
import 'package:day34/view/screens/profile_eidt_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 메인 함수에 비동기 함수 있으면 추가해줘야함
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => ProfileEditController(), fenix: true);
        Get.lazyPut(() => HomeController(), fenix: true);
      }),
      getPages: [
        GetPage(name: '/', page: () => const LoginScreen()),
        GetPage(name: '/home', page: () => const HomeScreen2()),
        GetPage(name: '/edit/profile', page: () => const ProfileEditPage()),
      ],
      initialRoute: '/',
    );
  }
}
