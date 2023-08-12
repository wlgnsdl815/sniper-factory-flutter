import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:weekly_assessment/screens/restaurant_list_screen.dart';
import 'package:weekly_assessment/screens/navi_screen.dart';
import 'package:weekly_assessment/styles/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final initCameraPosition = NLatLng(35.1796, 129.0756);
    return DefaultLayOut(
      title: '🍽️ 부산 맛집 🍽️',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        // 지도로 보기를 누르면 기본 카메라 포지션을 넘겨준다.
                        builder: (_) => NaviScreen(
                              cameraPosition: initCameraPosition,
                            )));
              },
              child: Text(
                '지도로 보기',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => RestaurantListScreen()));
              },
              child: Text(
                '리스트로 보기',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
