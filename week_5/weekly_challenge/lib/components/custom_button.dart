import 'package:flutter/material.dart';
import 'package:weekly_challenge/screen/search.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SearchScreen()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[350],
        elevation: 0.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Colors.grey[500],
          ),
          Text(
            '메일 검색',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
