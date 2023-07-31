import 'package:flutter/material.dart';

class ListViewSeparatedWidget extends StatelessWidget {
  const ListViewSeparatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewSeparated Widget'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: false,
        leading: Icon(Icons.people),
        actions: [
          Icon(Icons.share),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Text(index.toString());
        },
        separatorBuilder: (context, index) {
          if (index % 2 == 0) return Divider();
          return SizedBox();
        },
        itemCount: 100,
      ),
    );
  }
}
