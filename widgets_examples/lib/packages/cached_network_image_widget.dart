import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:widgets_examples/layout/default_layout.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'CachedNetworkImage',
      body: Column(
        children: [
          CachedNetworkImage(
              imageUrl: 'https://robohash.org/411.png?set=set1&size=150x150'),
          CircleAvatar(
            // Provider 안에 넣어주면, 캐시가 있는지 먼저 확인한다.
            backgroundImage: CachedNetworkImageProvider(
                'https://robohash.org/411.png?set=set1&size=150x150'),
          ),
        ],
      ),
    );
  }
}
