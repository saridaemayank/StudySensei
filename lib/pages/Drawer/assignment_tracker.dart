import 'package:flutter/material.dart';
import 'package:study_sensei/pages/Homepage.dart';

class Assignment_Tracker extends StatefulWidget {
 final List<TodoItem> assignments;

  Assignment_Tracker({required this.assignments});

  @override
  State<Assignment_Tracker> createState() => _Assignment_TrackerState();
}

class _Assignment_TrackerState extends State<Assignment_Tracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assignement Tracker", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Font'),), backgroundColor: Color(0XFF8F00FF),),
    );
  }
}