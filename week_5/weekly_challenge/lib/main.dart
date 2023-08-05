import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weekly_challenge/screen/home.dart';

const searchListBox = 'searchListBox';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(searchListBox);

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[300]),
      home: HomeScreen(),
    );
  }
}
