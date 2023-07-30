import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secret_cat_sdk/api/api.dart';
import 'package:weekly_assessment/const/colors.dart';
import 'package:weekly_assessment/screens/first_screen.dart';
import 'package:weekly_assessment/screens/second_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      FirstScreen(),
      SecondScreen(),
    ];

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('''비밀 듣는 고양이(SNS형)
스나이퍼팩토리 교육용 앱'''),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.dev),
              title: Text('Teddy'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          '비밀듣는 고양이',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: screens[_bottomNavIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            // 모서리를 둥글게하려면 배경색을 투명으로 해줘야한다.
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '비밀을 공유해볼까요?',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _textEditingController,
                      cursorColor: primaryColor,
                      decoration: InputDecoration(
                        hintText: '비밀을 입력하세요.',
                        // 포커스 받았을 때
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        // 포커스 받지 않았을 때
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        SecretCatApi.addSecret(_textEditingController.text);

                        // 전송하고 나면 textController를 초기화
                        _textEditingController.clear();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor),
                      child: Text(
                        '공유하기',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        gapLocation: GapLocation.center,
        activeColor: Colors.black,
        icons: [FontAwesomeIcons.cat, FontAwesomeIcons.peopleGroup],
        activeIndex: _bottomNavIndex,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
