import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:widgets_examples/layout/default_layout.dart';
import 'package:widgets_examples/main.dart';

// 오타 방지를 위해서 변수로 만들었다.
const favoriteBox = 'favorite';

class HiveWidget extends StatelessWidget {
  const HiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Hive',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 제너릭에 Box를 넣어주면 자동완성이 잘 된다
          ValueListenableBuilder<Box>(
            // valueListenable이 변경되면 새로 build한다.
            // 열어둔 박스를 넣어주고 .listenable()을 붙여준다.
            valueListenable: Hive.box(favoriteBox).listenable(),
            builder: ((context, box, widget) {
              return Column(
                // 박스들을 text로 출력
                children: box.values.map((e) => Text(e.toString())).toList(),
              );
            }),
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(favoriteBox);

              print('keys: ${box.keys.toList()}');
              print('values: ${box.values.toList()}');
            },
            child: Text(
              '박스 프린트하기!',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(favoriteBox);
              // 값 넣는 법 1
              // box.add('테스트 3');

              // 값 넣는 법 2
              // 데이터를 생성하거나 업데이트 할 때 사용한다.
              box.put(1000, '새로운 데이터!!!');
            },
            child: Text('데이터 넣기!'),
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(favoriteBox);
              print(box.get(2));
            },
            child: Text('특정값 가져오기!'),
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(favoriteBox);
              box.deleteAt(2);
            },
            child: Text('특정값 삭제하기!'),
          ),
        ],
      ),
    );
  }
}
