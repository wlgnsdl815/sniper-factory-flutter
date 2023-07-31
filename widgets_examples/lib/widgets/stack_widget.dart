import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Widget'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: false,
        leading: Icon(Icons.people),
        actions: [
          Icon(Icons.share),
        ],
      ),
      body: Column(
        children: [
          // Stack은 자식위젯이 위로간다.
          Stack(
            children: [
              Container(
                color: Colors.red,
                width: 250,
                height: 250,
              ),
              Positioned(
                right: 0.0,
                bottom: 0.0,
                child: Container(
                  color: Colors.blue.withOpacity(0.4),
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
