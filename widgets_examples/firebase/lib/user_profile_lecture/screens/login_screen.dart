// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SFAC',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -2,
                  ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Text('아이디를 입력해주세요'),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Text('비밀번호를 입력해주세요'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('로그인하기'),
            ),
            TextButton(
              onPressed: _handleSignUp,
              child: Text('회원가입하기'),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: 16,
                    endIndent: 16,
                  ),
                ),
                Text('간편로그인'),
                Expanded(
                  child: Divider(
                    indent: 16,
                    endIndent: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _handleGoogleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.g_mobiledata,
                    color: Colors.white,
                  ),
                  Text(
                    '구글 로그인하기',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _handleLogin() => FirebaseAuth.instance.signInWithEmailAndPassword(
      email: 'test@gmail.com', password: '12341234');

  _handleSignUp() => FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: 'test@gmail.com', password: '12341234');

  _handleGoogleLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
