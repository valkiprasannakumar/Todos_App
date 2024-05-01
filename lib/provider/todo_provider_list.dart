import 'package:flutter/material.dart';
import 'package:todolist_app/model/todo_model.dart';

class TodoListProvider extends ChangeNotifier {
  final List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  void addTodo(String title,String subtitle) {
    _todos.add(TodoModel(title,subtitle));
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
