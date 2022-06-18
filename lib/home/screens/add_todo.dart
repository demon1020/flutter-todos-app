import 'package:flutter/material.dart';
import 'package:hiveflutter/home/model/todo_adapter_model.dart';
import 'package:hiveflutter/home/provider/todos_provider.dart';
import 'package:hiveflutter/home/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatefulWidget {
  AddTodo({
    Key? key,
  }) : super(key: key);
  final form_key = GlobalKey<FormState>();

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController title_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();

  void AddData() {
    Provider.of<TodosProvider>(context, listen: false).addData(Todo(
        title: title_controller.text,
        description: description_controller.text));
    print(Provider.of<TodosProvider>(context, listen: false).dataLength());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
        backgroundColor: Color(0xFF34465D),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: widget.form_key,
          child: ListView(
            children: [
              customTextField(
                controller: title_controller,
                label: 'Title',
                maxLine: 1,
              ),
              SizedBox(
                height: 20,
              ),
              customTextField(
                controller: description_controller,
                label: 'Description',
                maxLine: 4,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('Add Todo'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF34465D),
                  ),
                ),
                onPressed: () {
                  if (widget.form_key.currentState!.validate()) {
                    AddData();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
