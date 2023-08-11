import 'package:day28/screens/main_page.dart';
import 'package:day28/services/dictionary_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DictionaryService().getData('meet');
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MainPage(),
    );
  }
}
