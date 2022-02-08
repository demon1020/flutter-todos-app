import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hiveflutter/home/model/todo_adapter_model.dart';

class TodosProvider extends ChangeNotifier {
  Box<Todo> todoBox = Hive.box('todos');

  get todo => TodosProvider;

  int dataLength() {
    int length = todoBox.values.length;
    return length;
  }

  Todo? showData(int index) {
    if(index == -1){
     return null;
    }else{
      Todo? todo = todoBox.get(index);
      return todo;
    }
  }

  Future<Box<Todo>> addData(String title, String description) async {
    todoBox.add(Todo(title: title, description: description));
    notifyListeners();
    return todoBox;
  }

  void deleteData(int index) async {
    todoBox.deleteAt(index);
    notifyListeners();
  }
  void updateData(int index,String title, String description){
    int result;
    //deleteData(index);
    todoBox.putAt(index, Todo(title: title, description: description));
  }
}
