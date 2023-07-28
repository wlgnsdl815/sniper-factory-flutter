import 'package:day18/components/buttons.dart';
import 'package:day18/const/colors.dart';
import 'package:day18/screens/see_author_screen.dart';
import 'package:day18/screens/see_secret_screen.dart';
import 'package:day18/screens/share_secret_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage('assets/images/bamboo.png'),
              backgroundColor: circleAvatarColor,
            ),
            SizedBox(height: 8.0),
            Text(
              '스팩 대나무 숲',
              style: TextStyle(
                color: fontColor,
                fontSize: 30.0,
              ),
            ),
            SizedBox(height: 32.0),
            CustomListTile(
              title: '비밀보기',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SeeSecretScreen()));
              },
            ),
            CustomListTile(
              title: '작성자들보기',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SeeAuthorScreen()));
              },
            ),
            CustomListTile(
              title: '비밀공유',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ShareSecretScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
