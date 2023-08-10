// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:day27/models/user_models.dart';
import 'package:day27/screens/detail_screen.dart';
import 'package:day27/services/user_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        title: Text('My Contacts'),
      ),
      body: FutureBuilder(
        future: UserService().getData(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                User user = snapshot.data![index];
                String imgUrl =
                    'https://xsgames.co/randomusers/assets/avatars/male/${user.id}.jpg';
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(imgUrl),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailScreen(
                                    user: user,
                                    imgUrl: imgUrl,
                                  )));
                    },
                    icon: Icon(Icons.navigate_next),
                  ),
                );
              }),
            );
          }
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
