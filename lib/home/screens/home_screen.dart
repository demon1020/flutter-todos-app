import 'package:flutter/material.dart';
import 'package:hiveflutter/home/provider/todos_provider.dart';
import 'package:hiveflutter/home/screen/add_todo.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        backgroundColor: Color(0xFF34465D),
      ),
      body: Consumer<TodosProvider>(
        builder: (context, todosProvider, _) {
          if (todosProvider.dataLength() == 0) {
            return Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              itemCount: todosProvider.dataLength(),
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(todosProvider.showData(index)!.title),
                    subtitle: Text(todosProvider.showData(index)!.description),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Color(0xFF34465D),
                      onPressed: () {
                        if (index == 0) {
                          todosProvider.disposeDB();
                        } else {
                          todosProvider.deleteData(index);
                          print(todosProvider.dataLength());
                        }
                      },
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddTodo(),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF34465D),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTodo(),
            ),
          );
        },
      ),
    );
  }
}
