// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:day26/components/filter_bottom_sheet.dart';
import 'package:day26/components/todo_card.dart';
import 'package:day26/models/todo_model.dart';
import 'package:day26/services/todo_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoFilter _todoFilterStatus = TodoFilter.all;
  List<Todo> removedList = [];
  List<Todo> filteredList = [];
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
                Builder(builder: (context) {
                  return IconButton(
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) => FilterBottomSheet(
                          filter: _todoFilterStatus,
                          onApply: (todoFilter) {
                            setState(() {
                              _todoFilterStatus = todoFilter;
                            });
                          },
                        ),
                      );
                    },
                    icon: Icon(Icons.filter_list),
                  );
                }),
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
            List<Todo> todoDataList = snapshot.data!;
            filteredList = todoDataList
                .where((element) => !removedList
                    .any((removedData) => removedData.id == element.id))
                .toList();

            return ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                Todo todo = filteredList[index];
                return TodoCard(
                  todo: todo,
                  onDismissed: (direction) {
                    removedList.add(todo);
                    filteredList.remove(todo);
                    print(filteredList.length);
                  },
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
