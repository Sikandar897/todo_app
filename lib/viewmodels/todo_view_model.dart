import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/todo_model.dart';

class TodoViewModel with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  TodoViewModel() {
    loadTodos();
  }

  // Add new todo
  void addTodo(Todo todo) {
    _todos.add(todo);
    saveTodos();
    notifyListeners();
  }

  // Edit an existing todo
  void updateTodo(int index, Todo todo) {
    _todos[index] = todo;
    saveTodos();
    notifyListeners();
  }

  // Delete a todo
  void deleteTodo(int index) {
    _todos.removeAt(index);
    saveTodos();
    notifyListeners();
  }

  // Mark a todo as completed
  void toggleTodoStatus(int index) {
    _todos[index].isCompleted = !_todos[index].isCompleted;
    saveTodos();
    notifyListeners();
  }

  // Load todos from SharedPreferences
  Future<void> loadTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? todoListString = prefs.getString('todo_list');
    if (todoListString != null) {
      List<dynamic> todoListJson = jsonDecode(todoListString);
      _todos = todoListJson.map((todo) => Todo.fromMap(todo)).toList();
    }
    notifyListeners();
  }

  // Save todos to SharedPreferences
  Future<void> saveTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> todoListMap =
        _todos.map((todo) => todo.toMap()).toList();
    prefs.setString('todo_list', jsonEncode(todoListMap));
  }
}
