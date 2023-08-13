import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weekly_assessment/models/item_model.dart';
import 'package:weekly_assessment/riverpod/restaurant_api_provider.dart';
import 'package:weekly_assessment/styles/default_layout.dart';

// riverpod 사용을 위해 ConsumerWidget으로 변경
class NaviScreen extends ConsumerWidget {
  final double zoom;
  final NLatLng cameraPosition;

  const NaviScreen({
    super.key,
    required this.zoom,
    required this.cameraPosition,
  });

  @override
  // ref를 받아준다
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(restaurantApiProvider);
    final Set<NMarker> markers = {};

    // state의 값으로 markers에 담아준다.
    if (state is AsyncData<List<Item>>) {
      List<Item> itemList = state.value;
      markers.clear();
      Set<NMarker> newMarkers = itemList.map((item) {
        NMarker marker = NMarker(
          id: '${item.UC_SEQ}',
          position: NLatLng(item.LAT!, item.LNG!),
          caption: NOverlayCaption(text: item.MAIN_TITLE!),
        );
        marker.setOnTapListener((overlay) {
          return showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.MAIN_TITLE!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          item.MAIN_IMG_NORMAL!,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text('주소: ${item.ADDR1}'),
                      SizedBox(height: 10.0),
                      Text('전화번호: ${item.CNTCT_TEL}'),
                      SizedBox(height: 10.0),
                      Text('소개: ${item.ITEMCNTNTS}'),
                    ],
                  ),
                );
              });
        });
        return marker;
      }).toSet();
      markers.addAll(newMarkers);
    }
    // final NMarker marker1 =
    //     NMarker(id: 'id', position: NLatLng(35.1796, 129.0756));
    // marker1.setCaption(NOverlayCaption(text: 'text'));
    return DefaultLayOut(
      drawer: Drawer(),
      title: '🍽️ 부산 맛집 지도 🍽️',
      body: state.when(
        data: (data) => NaverMap(
          onMapReady: (controller) {
            controller.addOverlayAll(markers);
          },
          options: NaverMapViewOptions(
            // 카메라 포지션을 지정
            initialCameraPosition: NCameraPosition(
              target: cameraPosition,
              zoom: zoom,
            ),
          ),
        ),
        error: (error, stack) => throw Exception(error),
        loading: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('네이버 맵 로딩 중입니다.'),
              CircularProgressIndicator(),
            ],
          ),
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
