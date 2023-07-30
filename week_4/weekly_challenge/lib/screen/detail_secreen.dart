import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String images;
  const DetailScreen({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    // iOS 시뮬레이터는 뒤로가기 버튼이 하단에 없어서 화면을 터치하면 뒤로간다.
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Center(
          child: Image.network(
            images,
            errorBuilder: (context, error, stackTrace) {
              print(error);
              return Center(
                  child: Text(
                '이미지가 없어요 ㅠㅠ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ));
            },
          ),
        ),
      ),
    );
  }
}
