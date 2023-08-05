import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey[500],
        ),
        fillColor: Colors.grey[370],
        filled: true,
        hintText: '메일 검색',
        hintStyle: TextStyle(
          color: Colors.grey[500],
        ),
      ),
    );
  }
}
