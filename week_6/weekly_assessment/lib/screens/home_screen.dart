import 'package:flutter/material.dart';
import 'package:weekly_assessment/screens/restaurant_list_screen.dart';
import 'package:weekly_assessment/screens/navi_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => NaviScreen()));
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
