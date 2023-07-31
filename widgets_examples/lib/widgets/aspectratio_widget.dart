import 'package:flutter/material.dart';

class AspectRatioWidget extends StatefulWidget {
  const AspectRatioWidget({super.key});

  @override
  State<AspectRatioWidget> createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AspectRatioWidget> {
  double currentOpacity = 1;
  double width = 100;
  double height = 100;
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio Widget'),
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
        child: GestureDetector(
          onTap: () {
            setState(() {
              width = width == 100 ? 300 : 100;
              height = height == 100 ? 300 : 100;
              color = color == Colors.blue ? Colors.red : Colors.blue;
            });
          },
          child: AspectRatio(
            // 4:3 비율
            aspectRatio: 4 / 3,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: width,
              height: height,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
