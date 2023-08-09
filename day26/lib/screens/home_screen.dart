// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:day26/components/filter_bottom_sheet.dart';
import 'package:day26/components/todo_listview.dart';
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

  Future<List<Todo>> refreshData = TodoService().getData();

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
                  onPressed: () {
                    setState(() {
                      refreshData = TodoService().getData();
                      removedList = [];
                    });
                  },
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: refreshData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Todo> todoDataList = snapshot.data!;

            filteredList = todoDataList
                .where((element) => !removedList
                    .any((removedData) => removedData.id == element.id))
                .toList();

            switch (_todoFilterStatus) {
              case TodoFilter.all:
                return TodoListView(
                  filteredList: filteredList,
                  removedList: removedList,
                );

              case TodoFilter.completed:
                List<Todo> completedList =
                    filteredList.where((todos) => todos.completed).toList();
                return TodoListView(
                  filteredList: completedList,
                  removedList: removedList,
                );

              case TodoFilter.incompleted:
                List<Todo> incompletedList =
                    filteredList.where((todos) => !todos.completed).toList();
                return TodoListView(
                  filteredList: incompletedList,
                  removedList: removedList,
                );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
