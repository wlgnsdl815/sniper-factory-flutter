// ignore_for_file: prefer_const_constructors
import 'package:day6/screen/contact_screen/contact_detail_screen.dart';

import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final String name;
  final String? phone;
  final String? imgUrl;
  final Icon? icon;

  const ContactTile({
    super.key,
    required this.name,
    this.phone,
    this.imgUrl,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ContactDetailScreen(
                      name: name,
                      phone: phone!,
                      imgUrl: imgUrl!,
                    )));
      },
      child: ListTile(
        title: Text(name),
        subtitle: phone != null ? Text(phone!) : null,
        leading: imgUrl != null
            ? CircleAvatar(
                backgroundImage: NetworkImage(imgUrl!),
              )
            : null,
        trailing: icon ?? Icon(Icons.call),
      ),
    );
  }
}
