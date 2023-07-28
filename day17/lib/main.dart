import 'package:day17/screen/home_screen.dart';
import 'package:day17/screen/img_picker_assignment.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(colorScheme: ColorScheme.dark()),
      home: ImagePickerAssignment(),
    );
  }
}
