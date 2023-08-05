import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weekly_challenge/components/custom_textfeild.dart';
import 'package:weekly_challenge/main.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: CustomTextField(),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
            ),
            child: Text(
              '상세',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder<Box<String>>(
        // TextField에서 입력 한 값을 리스닝
        valueListenable: Hive.box<String>(searchListBox).listenable(),
        builder: (context, value, child) {
          // Box<String>으로 열었기 때문에 제너릭으로 다 명시해주었다.
          Box<String> box = Hive.box<String>(searchListBox);
          List<String> boxList = box.values.toList();
          print(boxList);
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        // 최근 순서부터 출력
                        text: boxList[boxList.length - 1 - index],
                      ),
                      TextSpan(
                        text: ' (전체)',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    box.deleteAt(boxList.length - 1 - index);
                    print(boxList);
                  },
                  icon: Icon(Icons.close),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
