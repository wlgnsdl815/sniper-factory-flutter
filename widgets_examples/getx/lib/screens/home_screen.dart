import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => SecondScreen());
        },
      ),
      body: Center(
        child: Text('Center'),
      ),
    );
  }
}
