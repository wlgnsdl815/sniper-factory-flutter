import 'package:day18/const/colors.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  const DefaultLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: fontColor,
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          '뒤로가기',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage('assets/images/drew-bae-bCvYLDV3CV4-unsplash.jpg'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: child,
        ),
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
