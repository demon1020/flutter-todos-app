import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class TodosProvider extends ChangeNotifier {

  late List<Todo> todoList;

  Future <List<Todo>> getData() async {
    todoList = await Repository().getData();
    return todoList;
  }

  void addTodo(Todo todo) {
    todoList.add(todo);
    Repository().addData(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    todoList.remove(todo);
    Repository().removeTodo(todo);
    notifyListeners();
  }

  notifyListeners();
}
