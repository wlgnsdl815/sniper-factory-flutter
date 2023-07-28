// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          // 마진을 넣어주기 위한 컨테이너
          margin: EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(dataList[index]['url']!),
            ),
            title: Text(
              dataList[index]['title']!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Row(
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: Colors.white,
                ),
                SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    dataList[index]['singer']!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1, // 최대 1줄
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  ' • ${dataList[index]['duration']}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            trailing: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        );
      },
      itemCount: dataList.length,
    );
  }
}

List<Map<String, String>> dataList = [
  {
    'title': 'Come with me',
    'singer': 'Surfaces 및 salem ilese',
    'url': 'assets/music_come_with_me.png',
    'duration': '3:00',
  },
  {
    'title': 'Good day',
    'singer': 'Surfaces',
    'url': 'assets/music_good_day.png',
    'duration': '3:00',
  },
  {
    'title': 'Honesty',
    'singer': 'Pink Sweat\$',
    'url': 'assets/music_honesty.png',
    'duration': '3:09',
  },
  {
    'title': 'I Wish I Missed My Ex',
    'singer': '마할리아 버크마',
    'url': 'assets/music_i_wish_i_missed_my_ex.png',
    'duration': '3:24',
  },
  {
    'title': 'Plastic Plants',
    'singer': '마할리아 버크마',
    'url': 'assets/music_plastic_plants.png',
    'duration': '3:20',
  },
  {
    'title': 'Sucker for you',
    'singer': '맷 테리',
    'url': 'assets/music_sucker_for_you.png',
    'duration': '3:24',
  },
  {
    'title': 'Summer is for falling in love',
    'singer': 'Sarah Kang & Eye Love Brandon',
    'url': 'assets/music_summer_is_for_falling_in_love.png',
    'duration': '3:00',
  },
  {
    'title': 'These days(feat. Jess Glynne, Macklemore & Dan Caplen)',
    'singer': 'Rudimental',
    'url': 'assets/music_these_days.png',
    'duration': '3:00',
  },
  {
    'title': 'You Make Me',
    'singer': 'DAY6',
    'url': 'assets/music_you_make_me.png',
    'duration': '3:39',
  },
  {
    'title': 'Zombie Pop',
    'singer': 'DRP IAN',
    'url': 'assets/music_zombie_pop.png',
    'duration': '1:55',
  },
];

// 강의 코드

// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:flutter/material.dart';

// class MusicTile extends StatelessWidget {
//   final String title;
//   final String artist;
//   final String duration;
//   final String img;
//   const MusicTile({
//     super.key,
//     required this.title,
//     required this.artist,
//     required this.duration,
//     required this.img,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: ClipRRect(
//         borderRadius: BorderRadius.circular(4),
//         child: Image.asset(img),
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//         maxLines: 2,
//         overflow: TextOverflow.ellipsis,
//       ),
//       subtitle: Row(
//         children: [
//           Icon(
//             Icons.check_circle,
//             size: 18,
//           ),
//           SizedBox(width: 4),
//           Flexible(
//             child: Text(
//               artist,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Text('•'),
//           Text(
//             duration,
//           ),
//         ],
//       ),
//       trailing: Icon(
//         Icons.more_vert,
//       ),
//     );
//   }
// }
