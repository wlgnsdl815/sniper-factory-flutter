import 'package:flutter/material.dart';

class DefaultLayOut extends StatelessWidget {
  final FloatingActionButton? floatingActionButton;
  final String title;
  final Widget body;
  final Widget? drawer;

  const DefaultLayOut({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButton,
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
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
