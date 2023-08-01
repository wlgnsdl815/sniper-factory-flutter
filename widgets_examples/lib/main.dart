import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:widgets_examples/packages/hive_widget.dart';
import 'package:widgets_examples/packages/shared_preferences_widget.dart';

// // 오타방지를 위해 변수로 선언
// const favoriteBox = 'favorite';
// // HiveBox를 사용하기 위해서 비동기 함수로 만들었다.
void main() async {
  await Hive.initFlutter();
  await Hive.openBox(favoriteBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SharedPreferencesWidget(),
    );
  }
}