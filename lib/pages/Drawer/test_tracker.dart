import 'package:flutter/material.dart';

class Test_Tracker extends StatefulWidget {
  const Test_Tracker({super.key});

  @override
  State<Test_Tracker> createState() => _Test_TrackerState();
}

class _Test_TrackerState extends State<Test_Tracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Tracker", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Font'),), backgroundColor: Color(0XFFCDD8D9),),
    );
  }
}