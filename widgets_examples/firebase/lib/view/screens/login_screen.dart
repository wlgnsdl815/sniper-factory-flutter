// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _handleLoginButton() async {
    var res = FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'test@gmail.com', password: '12341234');
    print(res);
  }

  _handleSignUpButton() {
    print('회원가입 버튼 눌려짐');
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: 'test@gmail.com',
      password: '12341234',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('ID를 입력하세요'),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('PW를 입력하세요'),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _handleLoginButton,
              child: Text('로그인하기'),
            ),
            TextButton(
              onPressed: _handleSignUpButton,
              child: Text('회원가입하기'),
            ),
            IconButton(
              onPressed: signInWithGoogle,
              icon: Icon(
                Icons.g_mobiledata,
              ),
            ),
            TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text('로그아웃'))
          ],
        ),
      ),
    );
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
