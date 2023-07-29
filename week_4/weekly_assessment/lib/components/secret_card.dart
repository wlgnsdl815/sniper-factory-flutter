import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secret_cat_sdk/model/secret.dart';

class SecretCard extends StatelessWidget {
  final Secret secret;
  const SecretCard({super.key, required this.secret});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
              ),
              title:
                  Text(secret.author == null ? '익명의 누군가' : secret.author!.name),
              subtitle: Text(
                // intl 패키지를 사용해서 날짜 포맷 지정
                DateFormat.MEd().format(secret.createdAt),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                secret.secret,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
