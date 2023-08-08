import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weekly_challenge/screen/home.dart';
import 'package:weekly_challenge/services/email_service.dart';

const searchListBox = 'searchListBox';
const removedListBox = 'removedListBox';
const wholeDataListBox = 'wholeDataListBox';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(searchListBox);
  await Hive.openBox<String>(removedListBox);

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    EmailService().getData();
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[300]),
      home: HomeScreen(),
    );
  }
}
