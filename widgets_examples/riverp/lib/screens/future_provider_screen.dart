import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverp/layout/default_layout.dart';
import 'package:riverp/providers/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AsyncValue 타입으로 들어오게 된다.
    // AsyncValue 타입은 무조건 .when()함수가 존재한다.
    final AsyncValue state = ref.watch(multiplesFutureProvider);
    return DefaultLayout(
      title: 'Future Provider Screen',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FutureProvider는 state.when()으로 현재 데이터의 로딩, 에러 등을 관리 가능
            state.when(
              // 로딩이 끝나면
              data: (data) {
                return Text(data.toString());
              },
              // 에러가 있으면
              error: (err, stack) => Text(err.toString()),
              // 로딩중일때.
              // 새로고침 -> 다시 로딩
              // 뒤로가기 했다가 누르면 -> 로딩 안함. 이미 데이터를 받아왔기 때문
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
