import 'package:day34/firebase_options.dart';
import 'package:day34/user_profile_lecture/screens/login_screen.dart';
import 'package:day34/user_profile_lecture/screens/user_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

enum ScreenState { login, user }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// GetX를 사용하지 않고 스크린을 이동하는 법
class _MyAppState extends State<MyApp> {
  ScreenState screenState = ScreenState.login;

  _onAuthStateChanged(User? user) => setState(
      () => screenState = user != null ? ScreenState.user : ScreenState.login);

  _buildScreen(state) {
    switch (state) {
      case ScreenState.login:
        return const LoginScreen();
      case ScreenState.user:
        return UserScreen(
          user: FirebaseAuth.instance.currentUser!,
        );
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen(_onAuthStateChanged);
    FirebaseAuth.instance.userChanges().listen((event) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: _buildScreen(screenState),
    );
  }
}
