// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weekly_assessment/riverpod/restaurant_api_provider.dart';
import 'package:weekly_assessment/riverpod/selected_provider.dart';
import 'package:weekly_assessment/screens/navi_screen.dart';
import 'package:weekly_assessment/styles/default_layout.dart';

const district = [
  '중구',
  '서구',
  '동구',
  '영도구',
  '부산진구',
  '동래구',
  '남구',
  '북구',
  '해운대구',
  '사하구',
  '금정구',
  '강서구',
  '연제구',
  '수영구',
  '사상구',
  '기장군',
];

class RestaurantListScreen extends ConsumerWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 레스토랑 데이터를 담고 있다.
    final state = ref.watch(restaurantApiProvider);
    // Drawer의 선택 값을 담고 있다.
    final selected = ref.watch(selectedProvider);

    return DefaultLayOut(
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              '지역 선택',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...district.map(
            (e) => ListTile(
              onTap: () {
                ref.read(selectedProvider.notifier).update((state) => e);
              },
              title: Text(e),
              selected: e == selected,
              selectedColor: Colors.white,
              selectedTileColor: Colors.green,
            ),
          ),
        ],
      )),
      title: '🍽️ 부산 맛집 리스트 🍽️',
      body: state.when(
        data: (restaurant) {
          // 선택된 지역의 레스토랑 리스트
          var filteredList = restaurant
              .where((element) => element.GUGUN_NM == selected)
              .toList();

          print(selected);
          print(filteredList);
          // 선택이 되었다면 선택된 지역의 레스토랑만 보여주기
          if (selected.isNotEmpty) {
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(
                indent: 15.0,
                endIndent: 15.0,
                color: Colors.grey,
              ),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                      filteredList[index].MAIN_IMG_THUMB.toString()),
                  title: Text(
                    filteredList[index].MAIN_TITLE.toString(),
                  ),
                  subtitle: Text(filteredList[index].ADDR1.toString()),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              // 위도와 경도를 넘겨주어서 카메라 포지션을 정해준다.
                              builder: (_) => NaviScreen(
                                    zoom: 18,
                                    cameraPosition: NLatLng(
                                        filteredList[index].LAT!,
                                        filteredList[index].LNG!),
                                  )));
                    },
                    icon: Icon(
                      Icons.map,
                      color: Colors.green,
                    ),
                  ),
                );
              },
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              indent: 15.0,
              endIndent: 15.0,
              color: Colors.grey,
            ),
            itemCount: restaurant.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading:
                    Image.network(restaurant[index].MAIN_IMG_THUMB.toString()),
                title: Text(
                  restaurant[index].MAIN_TITLE.toString(),
                ),
                subtitle: Text(restaurant[index].ADDR1.toString()),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            // 위도와 경도를 넘겨주어서 카메라 포지션을 정해준다.
                            builder: (_) => NaviScreen(
                                  zoom: 18,
                                  cameraPosition: NLatLng(
                                      restaurant[index].LAT!,
                                      restaurant[index].LNG!),
                                )));
                  },
                  icon: Icon(
                    Icons.map,
                    color: Colors.green,
                  ),
                ),
              );
            },
          );
        },
        error: (error, stack) {
          throw Exception(error);
        },
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text('뒤로가기'),
      ),
    );
  }
}
