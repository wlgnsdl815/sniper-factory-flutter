import 'package:day26/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id.toString()),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: todo.completed ? Colors.green.shade100 : null,
          border: todo.completed
              ? Border.all(
                  color: Colors.green,
                )
              : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: Text(
            todo.title,
            style: TextStyle(
              color: todo.completed ? Colors.green : null,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: todo.completed
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                )
              : null,
        ),
      ),
    );
  }
}
