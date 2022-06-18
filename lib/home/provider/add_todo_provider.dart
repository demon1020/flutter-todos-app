import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class AddTodoProvider extends ChangeNotifier{
  get addTodo => Repository().addData;
  //get addToList => Repository().addToList;
  notifyListeners();
}