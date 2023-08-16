import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});
  static const String route = '/detail';

  @override
  Widget build(BuildContext context) {
    var params = Get.parameters;
    var arguments = Get.arguments;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$params'),
            Text('$arguments'),
          ],
        ),
      ),
    );
  }
}
