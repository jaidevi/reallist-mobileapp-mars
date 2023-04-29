import 'package:flutter/material.dart';

class Spotscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   // final Todo todo = ModalRoute.of(context).settings.arguments;

    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text("todo.title"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("todo.description"),
      ),
    );
  }
}