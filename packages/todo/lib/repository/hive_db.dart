part of todo;

class Repository {

  //creating a box reference for todos
  Box<Todo> todoBox = Hive.box('todos');

  //getting all the todos from hive db
  Future<List<Todo>> getData() async{
    List<Todo> todos = await todoBox.values.toList();
    return todos;
  }

  //adding the todoo into the into the hive db
  Future<void> addData(Todo todo) async {
    await todoBox.add(todo);
    todo.save();
    getData();
  }

  //deleting the todoo
  Future<void> removeTodo(Todo todo) async {
    todo.delete();
  }
}