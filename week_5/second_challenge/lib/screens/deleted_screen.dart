import 'package:flutter/material.dart';
import 'package:second_challenge/models/email_model.dart';

class DeletedScreen extends StatelessWidget {
  final List<Email> deletedEmailList;
  const DeletedScreen({super.key, required this.deletedEmailList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: Text('휴지통'),
      ),
      body: ListView.builder(
        itemCount: deletedEmailList.length,
        itemBuilder: ((context, index) {
          return ListTile(
            leading: Icon(
              Icons.mail_outline,
            ),
            title: Text(
              deletedEmailList[index].from,
            ),
          );
        }),
      ),
    );
  }
}
