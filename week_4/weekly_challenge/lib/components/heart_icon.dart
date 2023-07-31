import 'package:day16/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HeartIcon extends StatefulWidget {
  final String imgUrl;
  final String msg;
  final int index;
  const HeartIcon({
    super.key,
    required this.imgUrl,
    required this.msg,
    required this.index,
  });

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool isLiked = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // 처음 어플 시작할 때 박스를 불러와서 key가 있으면 true
    final box = Hive.box(favoriteBox);
    isLiked = box.containsKey(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box(favoriteBox).listenable(),
      builder: (context, value, child) {
        // 다시 빌드할 때 isLiked가 키가 있으면 true 없으면 false
        isLiked = Hive.box(favoriteBox).containsKey(widget.index);
        return InkWell(
          onTap: () {
            setState(() {
              isLiked = !isLiked;
            });
            final box = Hive.box(favoriteBox);

            if (isLiked) {
              box.put(widget.index, {
                'url': widget.imgUrl,
                'msg': widget.msg,
              });
            }

            if (!isLiked) {
              box.delete(widget.index);
            }
          },
          child: Icon(
            Icons.favorite,
            color: isLiked ? Colors.red : Colors.grey,
          ),
        );
      },
    );
  }
}
