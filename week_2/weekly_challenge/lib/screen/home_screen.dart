// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weekly_challenge/component/dataListTile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: _CustomListView(),
      bottomNavigationBar: _CustomBottomNavigationBar(),
    );
  }

  renderAppBar() {
    return AppBar(
      actionsIconTheme: IconThemeData(
        color: Colors.black,
        size: 30.0,
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      titleSpacing: 20.0, // 간격 설정
      title: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          '친구',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
      ),
      centerTitle: false,
      actions: List.generate(actionsList.length, (index) {
        // map 함수를 사용했었으나 index를 전달 할 수 없어서 List.generate 사용
        final icon = actionsList[index];
        final paddingRight = index == actionsList.length - 1
            ? 30.0
            : 4.0; // 마지막 아이콘에만 오른쪽 패딩을 30.0으로 설정
        return Padding(
          padding: EdgeInsets.fromLTRB(8.0, 8.0, paddingRight, 8.0),
          child: icon,
        );
      }),
    );
  }
}

class _CustomListView extends StatelessWidget {
  const _CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Image.asset(
          'assets/event_1.png',
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
          child: Row(
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    28.0,
                  ),
                  child: Image.network(
                    'https://picsum.photos/100/100',
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                'SFAC',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
              SizedBox(height: 10.0),
              Text(
                '친구 687',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
        ),
        DataListTile(
          name: '전여친',
          msg: '똥차다음벤츠라더니',
          url: 'https://picsum.photos/95/95',
        ),
        DataListTile(
          name: '우리형',
          msg: '40000/24000',
          url: 'https://picsum.photos/90/90',
        ),
        DataListTile(
          name: '썸남',
          msg: '+3일',
          url: 'https://picsum.photos/85/85',
        ),
        DataListTile(
          name: '마이클',
          msg: '',
          url: 'https://picsum.photos/80/80',
        ),
        DataListTile(
          name: '친구1',
          msg: '',
          url: 'https://picsum.photos/78/78',
        ),
        DataListTile(
          name: '민석이',
          msg: '',
          url: 'https://picsum.photos/87/87',
        ),
        DataListTile(
          name: '전여친',
          msg: '똥차다음벤츠라더니',
          url: 'https://picsum.photos/92/92',
        ),
        DataListTile(
          name: '전여친',
          msg: '똥차다음벤츠라더니',
          url: 'https://picsum.photos/93/93',
        ),
        DataListTile(
          name: '전여친',
          msg: '똥차다음벤츠라더니',
          url: 'https://picsum.photos/91/91',
        ),
        DataListTile(
          name: '전여친',
          msg: '똥차다음벤츠라더니',
          url: 'https://picsum.photos/88/88',
        ),
      ],
    );
  }
}

class _CustomBottomNavigationBar extends StatelessWidget {
  const _CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      backgroundColor: Colors.grey[200],
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false, // 선택된 label이 보이지 않게 해준다
      showUnselectedLabels: false, // 선택되지 않은 label이 보이지 않게 해준다
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'friend'),
        BottomNavigationBarItem(
          icon: Badge(
            // Notification 역할을 하기 위한 코드
            label: Text('99+'),
            child: Icon(
              Icons.chat_bubble_outline_rounded,
            ),
          ),
          label: 'chat',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye_outlined), label: 'view'),
        BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'shop'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'more'),
      ],
    );
  }
}

List<Widget> actionsList = [
  Icon(
    Icons.search,
  ),
  Icon(
    Icons.person_add_alt,
  ),
  Icon(
    Icons.music_note_outlined,
  ),
  Icon(
    Icons.settings_outlined,
  ),
];
