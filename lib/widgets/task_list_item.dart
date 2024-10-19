// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo_model.dart';
import '../utils/dialog_utils.dart';
import '../viewmodels/todo_view_model.dart';
import '../views/add_edit_todo_screen.dart';

class TaskListItem extends StatelessWidget {
  final Todo todo;
  final int index;

  const TaskListItem({required this.todo, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context, listen: false);

    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      subtitle: Text(todo.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              bool? confirm = await showConfirmationDialog(context, 'Edit Task',
                  'Are you sure you want to edit this task?');
              if (confirm ?? false) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddEditTodoScreen(todo: todo, index: index),
                  ),
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              bool? confirm = await showConfirmationDialog(context,
                  'Delete Task', 'Are you sure you want to delete this task?');
              if (confirm ?? false) {
                viewModel.deleteTodo(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Task deleted successfully.')),
                );
              }
            },
          ),
          Checkbox(
            value: todo.isCompleted,
            onChanged: (value) async {
              bool? confirm = await showConfirmationDialog(
                  context,
                  'Mark as Completed',
                  'Do you want to mark this task as completed?');
              if (confirm ?? false) {
                viewModel.toggleTodoStatus(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      value!
                          ? 'Task marked as completed.'
                          : 'Task marked as not completed.',
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
