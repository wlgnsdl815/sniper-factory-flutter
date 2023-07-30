import 'package:day16/screen/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _goToHome();
  }

  _goToHome() async {
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => HomeScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              40.0,
            ),
          ),
          width: 100,
          height: 100,
          child: Image.asset(
            'assets/images/splash_image.jpg',
          ),
        ),
      ),
    );
  }
}
