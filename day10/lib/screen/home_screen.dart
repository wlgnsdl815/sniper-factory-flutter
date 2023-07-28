// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_element

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSunActive = false;
  bool isMoonActive = false;
  bool isStarActive = false;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 20.0,
          ),
          child: Column(
            children: [
              _CustomListTile(
                title: 'Sun',
                leadingIcon: Icon(
                  Icons.sunny,
                  color: isSunActive ? Colors.red : null,
                ),
                onPressed: changeSunState,
              ),
              _CustomListTile(
                title: 'Moon',
                leadingIcon: Icon(
                  Icons.nightlight_round_outlined,
                  color: isMoonActive ? Colors.yellow : null,
                ),
                onPressed: changeMoonState,
              ),
              _CustomListTile(
                title: 'Star',
                leadingIcon: Icon(
                  Icons.star,
                  color: isStarActive ? Colors.yellow : null,
                ),
                onPressed: changeStarState,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                controller: textController,
                onSubmitted: (value) {
                  switch (value) {
                    case '태양':
                      setState(() {
                        changeSunState();
                      });
                  }
                  switch (value) {
                    case '달':
                      setState(() {
                        changeMoonState();
                      });
                  }
                  switch (value) {
                    case '별':
                      setState(() {
                        changeStarState();
                      });
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isSunActive = false;
            isMoonActive = false;
            isStarActive = false;
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  void changeSunState() {
    setState(() {
      isSunActive = !isSunActive;
    });
  }

  void changeMoonState() {
    setState(() {
      isMoonActive = !isMoonActive;
    });
  }

  void changeStarState() {
    setState(() {
      isStarActive = !isStarActive;
    });
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final Icon leadingIcon;

  final VoidCallback onPressed;

  const _CustomListTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      title: Text(title),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.arrow_right,
        ),
      ),
    );
  }
}
