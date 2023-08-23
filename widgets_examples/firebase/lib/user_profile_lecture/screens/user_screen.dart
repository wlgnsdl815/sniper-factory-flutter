import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _handleOnTap,
              child: CircleAvatar(
                radius: 100,
                backgroundImage:
                    user.photoURL != null ? NetworkImage(user.photoURL!) : null,
              ),
            ),
            SizedBox(height: 16),
            Text(user.displayName ?? 'No Name'),
            SizedBox(height: 16),
            Text(user.email ?? 'No Email'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }

  _handleOnTap() async {
    var picker = ImagePicker();
    var res = await picker.pickImage(source: ImageSource.gallery);
    if (res != null) {
      // storage 올리기
      var ref = FirebaseStorage.instance.ref('profile/${user.uid}');
      await ref.putFile(File(res.path));
      var downloadUrl = await ref.getDownloadURL();
      print(downloadUrl);

      // downloadUrl 받기
      user.updatePhotoURL(downloadUrl);
    }
  }
}
