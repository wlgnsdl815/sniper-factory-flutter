import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weekly_challenge/main.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box<String>(searchListBox).listenable(),
      builder: (context, value, child) => TextField(
        onSubmitted: (value) {
          Box<String> box = Hive.box<String>(searchListBox);
          box.add(value);

          print(box.values.runtimeType);
          textEditingController.clear();
        },
        controller: textEditingController,
        cursorColor: Colors.black,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIconColor: Colors.grey,
          focusColor: Colors.grey,
          fillColor: Colors.grey[200],
          filled: true,
          prefixIcon: Icon(
            Icons.search,
          ),
          hintText: "메일 검색",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
