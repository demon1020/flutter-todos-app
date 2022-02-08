import 'package:flutter/material.dart';
import 'package:hiveflutter/home/provider/todos_provider.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatefulWidget {
  AddTodo({Key? key,}) : super(key: key);
  final form_key = GlobalKey<FormState>();

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController title_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: widget.form_key,
          child: ListView(
            children: [
              TextFormField(
                controller: title_controller,
                decoration: InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: description_controller,
                decoration: InputDecoration(
                  label: Text('Description'),
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<TodosProvider>(context, listen: false)
                      .addData(title_controller.text, description_controller.text);
                  Navigator.of(context).pop();
                },
                child: Text('Add Todo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
