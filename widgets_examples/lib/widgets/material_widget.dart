import 'package:flutter/material.dart';
import 'package:widgets_examples/layout/default_layout.dart';

class MaterialWidget extends StatelessWidget {
  const MaterialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Material',
      body: Center(
        child: Material(
          // 파랑색으로 지정
          color: Colors.blue,
          // 그림자를 5만큼 지정
          elevation: 5.0,
          // 모서리를 16만큼 둥글게
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
          ),
          // Material로 감싼 아래 컨테이너에 적용된다
          child: Container(
            width: 100,
            height: 100,
            child: Center(
              child: Text(
                '홍주',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
