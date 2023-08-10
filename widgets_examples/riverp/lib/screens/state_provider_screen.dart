import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverp/layout/default_layout.dart';
import 'package:riverp/providers/state_provider.dart';

// provider를 사용하려면 ConsumerWidget으로 변경
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  // WidgetRef를 넣어준다.
  Widget build(BuildContext context, WidgetRef ref) {
    // 변수 provider를 선언하고 numberProvider를 watch하게 한다.
    // ref를 사용해서 가능
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
      title: 'State Provider Screen',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                // ref.read에는 변경할 프로바이더.notifier와 .update키워드를 사용
                // 아래의 state는 StateProvider<int>((ref) => 0);의 ref와 같다.
                // 결론적으로 ref를 가져와서 + 1 증가시키고 반환하는 작업을 한다.
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: Text('UP'),
            ),
            ElevatedButton(
              onPressed: () {
                // .state는 provider 값을 직접 가져온다.
                ref.read(numberProvider.notifier).state =
                    ref.read(numberProvider.notifier).state + 1;
              },
              child: Text('DOWN'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => _NextScreen()));
              },
              child: Text('Next Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

// 다음 페이지에서도 provider의 값이 같은지 확인하기 위한 스크린
class _NextScreen extends ConsumerWidget {
  const _NextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
      title: 'State Provider Screen',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                // ref.read에는 변경할 프로바이더.notifier와 .update키워드를 사용
                // 아래의 state는 StateProvider<int>((ref) => 0);의 ref와 같다.
                // 결론적으로 ref를 가져와서 + 1 증가시키고 반환하는 작업을 한다.
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: Text('UP'),
            ),
          ],
        ),
      ),
    );
  }
}
