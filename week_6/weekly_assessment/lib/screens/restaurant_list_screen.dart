import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weekly_assessment/riverpod/restaurant_api_provider.dart';
import 'package:weekly_assessment/screens/navi_screen.dart';
import 'package:weekly_assessment/styles/default_layout.dart';

class RestaurantListScreen extends ConsumerWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(restaurantApiProvider);
    return DefaultLayOut(
      title: '🍽️ 부산 맛집 리스트 🍽️',
      body: state.when(
        data: (restaurant) {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              indent: 15.0,
              endIndent: 15.0,
              color: Colors.grey,
            ),
            itemCount: restaurant.length,
            itemBuilder: (context, index) => ListTile(
              leading:
                  Image.network(restaurant[index].MAIN_IMG_THUMB.toString()),
              title: Text(
                restaurant[index].TITLE.toString(),
              ),
              subtitle: Text(restaurant[index].ADDR1.toString()),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          // 위도와 경도를 넘겨주어서 카메라 포지션을 정해준다.
                          builder: (_) => NaviScreen(
                                cameraPosition: NLatLng(restaurant[index].LAT!,
                                    restaurant[index].LNG!),
                              )));
                },
                icon: Icon(
                  Icons.map,
                  color: Colors.green,
                ),
              ),
            ),
          );
        },
        error: (error, stack) {
          throw Exception(error);
        },
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
