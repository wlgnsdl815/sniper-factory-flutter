import 'package:day28/screens/home_screen.dart';
import 'package:day28/services/dictionary_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DictionaryService().getData();
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
