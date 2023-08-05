import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weekly_challenge/main.dart';

class RemoveScreen extends StatelessWidget {
  const RemoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: Text(
          '휴지통',
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box(removedListBox).listenable(),
        builder: (context, value, child) {
          Box box = Hive.box(removedListBox);
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: ((context, index) => ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        box.keyAt(index),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        box.getAt(index),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
