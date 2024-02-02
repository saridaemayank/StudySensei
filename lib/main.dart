// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_sensei/pages/Drawer/Timetable.dart';
import 'package:study_sensei/pages/Drawer/Todo.dart';
import 'package:study_sensei/pages/Drawer/assignment_tracker.dart';
import 'package:study_sensei/pages/Drawer/profile_screen.dart';
import 'package:study_sensei/pages/Drawer/test_tracker.dart';
import 'package:study_sensei/pages/Homepage.dart';
import 'package:study_sensei/themes/theme_constants.dart';
import 'package:study_sensei/themes/theme_provider.dart';

void main() => runApp(
  ChangeNotifierProvider(create: (context) => ThemeProvider(),child: MainApp(),)
 );


class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const Main();
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: '/',
  routes: {
    '/':(context) => HomePage(),
    '/first': (context) =>  Assignment_Tracker(assignments: [],),
    '/second': (context) => Test_Tracker(),
    '/third': (context) => TimeTable(),
    '/fourth': (context) => Todo(todos: [],),
    '/fifth': (context) => Profile_Screen(),

    // When navigating to the "/second" route, build the SecondScreen widget.
    
  },
      debugShowCheckedModeBanner: false,
    );
  }
}