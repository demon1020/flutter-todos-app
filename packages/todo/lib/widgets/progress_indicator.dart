import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  CustomProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            child: ListTile(
              leading: CircularProgressIndicator(),
              title: Text('Updating Todos List...'),
            ),
          ),
        ),
      ),
    );
  }
}
