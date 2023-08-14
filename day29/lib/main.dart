// ignore_for_file: prefer_const_constructors
import 'package:day29/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslations(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      home: HomeScreen(),
    );
  }
}

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnUs().keys,
        'ko_KR': KoKr().keys,
        // 여기에 다른 지역을 추가
      };
}

abstract class AppTranslation {
  Map<String, String> get keys;
}

class EnUs implements AppTranslation {
  @override
  Map<String, String> get keys => {
        'hello': 'Hello',
        // 여기에 다른 키/값 쌍 추가
      };
}

class KoKr implements AppTranslation {
  @override
  Map<String, String> get keys => {
        'hello': '안녕',
        // 여기에 다른 키/값 쌍 추가
      };
}
