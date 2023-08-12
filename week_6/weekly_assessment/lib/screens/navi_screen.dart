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
        return NMarker(
            id: '${item.UC_SEQ}', position: NLatLng(item.LAT!, item.LNG!));
      }).toSet();
      markers.addAll(newMarkers);
    }

    return DefaultLayOut(
      title: '🍽️ 부산 맛집 지도 🍽️',
      body: NaverMap(
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
    );
  }
}
