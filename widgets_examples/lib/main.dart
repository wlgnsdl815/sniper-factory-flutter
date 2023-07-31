import 'package:flutter/material.dart';
import 'package:widgets_examples/packages/cached_network_image_widget.dart';
import 'package:widgets_examples/packages/intl_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntlWidget(),
    );
  }
}
