import 'package:day16/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const favoriteBox = 'favorite';

void main() async {
  // 박스 초기화
  await Hive.initFlutter();
  // 박스 열기
  await Hive.openBox(favoriteBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
