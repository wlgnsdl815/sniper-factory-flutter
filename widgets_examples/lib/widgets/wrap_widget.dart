import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap Widget'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: false,
        leading: Icon(Icons.people),
        actions: [
          Icon(Icons.share),
        ],
      ),
      body: Center(
        child: Wrap(
          // 간격
          spacing: 8.0,
          // 다음 줄 과의 간격
          runSpacing: 8.0,
          children: List.generate(
            20,
            (index) => Container(
              color: colorList[index % 7],
              width: 90,
              height: 90,
            ),
          ),
        ),
      ),
    );
  }
}

List<Color> colorList = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];
