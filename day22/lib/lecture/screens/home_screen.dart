import 'package:day22/lecture/model/post.dart';
import 'package:day22/lecture/widget/post_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  // Post post = Post(
  //   symbolImg: symbolImg,
  //   title: title,
  //   createdAt: createdAt,
  //   readTime: readTime,
  //   thumbnailImg: thumbnailImg,
  //   comments: comments,
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          // child: PostCard(post: post),
          ),
    );
  }
}
