import 'package:day14/data/img_url.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('14일 과제 4번'),
        ),
        body: Center(
          child: CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              // 자동 재생
              autoPlay: true,
              // 자동 재생 시간을 2.5초로 설정
              autoPlayInterval: Duration(milliseconds: 2500),
              // 주어진 화면과 같은 애니메이션
              autoPlayCurve: Curves.easeOutBack,
            ),
            items: imageUrl.map((i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Image.network(i),
              );
            }).toList(),
          ),
        ));
  }
}
