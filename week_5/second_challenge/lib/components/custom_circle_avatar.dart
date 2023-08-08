import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatefulWidget {
  final bool isRead;
  const CustomCircleAvatar({
    super.key,
    required this.isRead,
  });

  @override
  State<CustomCircleAvatar> createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return widget.isRead
        ? SizedBox()
        : CircleAvatar(
            backgroundColor: Colors.green,
            radius: 4,
          );
  }
}
