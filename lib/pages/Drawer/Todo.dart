import 'package:flutter/material.dart';
import 'package:study_sensei/pages/Homepage.dart';

class Todo extends StatefulWidget {
 final List<TodoItem> todos;

  Todo({required this.todos});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Font', color: Colors.white),), backgroundColor: Color(0XFFE89394),),
    );
  }
}