// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'package:day7/music_tile.dart';
import 'package:day7/text_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: renderAppBar(),
        body: MusicTile(),
        bottomNavigationBar: _CustomBottomNavigationBar(),
        bottomSheet: _CustomBottomSheet(),
      ),
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      bottom: PreferredSize(
        // 앱바 하단에 Divider 넣기
        child: Divider(
          color: Colors.grey,
        ),
        preferredSize: Size.fromHeight(1),
      ),
      backgroundColor: Colors.black,
      elevation: 0.0,
      centerTitle: false,
      leading: Icon(
        Icons.arrow_back_ios,
      ),
      title: Text(
        '아워리스트',
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.airplay,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.search,
          ),
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
      selectedItemColor: Colors.white,
      backgroundColor: Colors.grey[900],
      unselectedItemColor: Colors.grey,
      currentIndex: 2,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '둘러보기',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.my_library_music,
          ),
          label: '보관함',
        ),
      ],
    );
  }
}

class _CustomBottomSheet extends StatelessWidget {
  const _CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 1,
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(dataList[8]['url']!),
            ),
            title: Text(
              dataList[8]['title']!,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              dataList[8]['singer']!,
              style: TextStyle(color: Colors.white60),
            ),
            trailing: Wrap(
              spacing: 12,
              // 위젯 사이 간격조절
              children: [
                Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                Icon(
                  Icons.skip_next,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
                height: 1,
              ),
              Container(
                width: 20,
                color: Colors.grey[200],
                height: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 강의 코드
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.from(
//         colorScheme: ColorScheme.dark(),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           shape: Border(
//             bottom: BorderSide(
//               color: Colors.white24,
//               width: 1,
//             ),
//           ),
//           elevation: 0,
//           leading: Icon(Icons.navigate_before),
//           title: Text('아워리스트'),
//           centerTitle: false,
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.airplay,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(
//                 Icons.search,
//               ),
//             ),
//           ],
//         ),
//         body: ListView(
//           children: [
//             MusicTile(
//               title: 'Good Day',
//               artist: 'Surfaces',
//               duration: '3:02',
//               img: 'assets/music_good_day.png',
//             ),
//             MusicTile(
//               title:
//                   'Good Day, Good Day, Good Day, Good Day, Good Day, Good Day, Good Day, Good Day, Good Day, Good Day',
//               artist: 'Surfaces',
//               duration: '3:02',
//               img: 'assets/music_these_days.png',
//             ),
//             MusicTile(
//               title:
//                   'Good Day, Good Day, Good Day, Good Day, Good Day, Good Day, Good Day, Good Day, Good Day, Good Day',
//               artist: 'Surfaces, Surfaces, Surfaces, Surfaces',
//               duration: '3:02',
//               img: 'assets/music_these_days.png',
//             ),
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: 2,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//               ),
//               label: '홈',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.explore,
//               ),
//               label: '둘러보기',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.my_library_music,
//               ),
//               label: '보관함',
//             ),
//           ],
//         ),
//         bottomSheet: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               height: 64,
//               color: Colors.white12,
//               child: ListTile(
//                 leading: ClipRRect(
//                   borderRadius: BorderRadius.circular(4),
//                   child: Image.asset(
//                     'assets/music_you_make_me.png',
//                   ),
//                 ),
//                 title: Text('You make me'),
//                 subtitle: Text(
//                   'DAY6',
//                 ),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(
//                         Icons.play_arrow,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(Icons.play_arrow),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               height: 1,
//               alignment: Alignment.centerLeft,
//               child: Container(
//                 width: 60,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
