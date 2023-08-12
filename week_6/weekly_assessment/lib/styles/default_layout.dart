import 'package:flutter/material.dart';

class DefaultLayOut extends StatelessWidget {
  final String title;
  final Widget body;
  const DefaultLayOut({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 0.0,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: body,
    );
  }
}
