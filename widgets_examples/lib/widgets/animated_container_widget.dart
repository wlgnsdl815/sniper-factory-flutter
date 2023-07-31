import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double currentOpacity = 1;
  double width = 100;
  double height = 100;
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer Widget'),
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
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: width,
            height: height,
            color: color,
          ),
        ),
      ),
    );
  }
}
