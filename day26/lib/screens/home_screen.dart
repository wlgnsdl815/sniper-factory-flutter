// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:day26/components/todo_card.dart';
import 'package:day26/models/todo_model.dart';
import 'package:day26/services/todo_servive.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, kToolbarHeight),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              centerTitle: false,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              title: Text('Todo App'),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: TodoService().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Todo todo = snapshot.data![index];
                return TodoCard(todo: todo);
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
