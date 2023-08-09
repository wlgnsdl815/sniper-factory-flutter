import 'package:day26/components/todo_card.dart';
import 'package:day26/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoListView extends StatelessWidget {
  final List<Todo> filteredList;
  final List<Todo> removedList;

  const TodoListView({
    super.key,
    required this.filteredList,
    required this.removedList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        Todo todo = filteredList[index];
        return TodoCard(
          todo: todo,
          onDismissed: (direction) {
            removedList.add(todo);
            filteredList.remove(todo);
          },
        );
      },
    );
  }
}
