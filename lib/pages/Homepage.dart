// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   List<TodoItem> todos = [];
List<TodoItem> assignments = [];

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          return Scaffold(
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Material(
                    elevation: 20.0,
                    child: Container(
                      color: Theme.of(context).colorScheme.primary,
                      height: 150.0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0, right: 40.0),
                        child: Align(child: Text("Navigator", style: TextStyle(fontFamily: 'Font', fontSize: 50.0, fontWeight: FontWeight.bold, color: Color(0xFFF6F1E7)),), alignment: Alignment.center,),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  ListTile(
                    title: Text('Assignment Tracker'),
                    onTap: () {
                    Navigator.pushNamed(context, '/first');
                    },
                    
                  ),
                  ListTile(
                    title: Text('Test Tracker'),
                    onTap: () {
                      Navigator.pushNamed(context, '/second');
                    },
                  ),
                  ListTile(
                    title: Text('TimeTable'),
                    onTap: () {
                      Navigator.pushNamed(context, '/third');
                    },
                  ),
                   ListTile(
                    title: Text('Todo List'),
                    onTap: () {
                      Navigator.pushNamed(context, '/fourth');
                    },
                  ),
                  SizedBox(height: 450.0,),
                  ListTile(
                    leading: Icon(Icons.account_circle_outlined, size: 40,color: Colors.white,),
                    tileColor: Color(0XFF868B8E),
                    title: Text('Profile', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                    onTap: () {
                      // Add your logic for Item 4
                      Navigator.pushNamed(context, '/fifth');
                    },
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Material(
                  elevation: 10.0,
                  child: Container(
                    padding: EdgeInsets.only(top: 50.0),
                    color: Theme.of(context).colorScheme.primary,
                    // color: Color(0XFFFBCEB1),
                    height: 200.0,
                    child: Column(
                      children: const [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 35, top: 25.0),
                              child: Text('Welcome!', style: TextStyle(
                                color: Color(0XFFF6F1E7), fontSize: 70.0, fontWeight: FontWeight.bold, fontFamily: 'Font',
                              ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 50.0,),
                // _buildTodoList('Todos', todos),
            SizedBox(height: 50),
            _buildTodoList('Assignments', assignments),
            // FancyButton(
            //   label: 'Add Todo',
            //   onPressed: () {
            //     _showAddTodoBottomSheet(context);
            //   },
            // ),
            SizedBox(height: 500.0),
            FancyButton(
              label: 'Add Assignment',
              onPressed: () {
                _showAddAssignmentBottomSheet(context);
              },
            ),
              ],
            ),
          );
        }
      );

  }

 void _showAddTodoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddTodoItemBottomSheet(
          onAdd: (String todoText) {
            setState(() {
              todos.add(TodoItem(text: todoText, isDone: false));
            });
            Navigator.pop(context); // Close the bottom sheet
          },
        );
      },
    );
  }

  void _showAddAssignmentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddItemBottomSheet(
          title: 'Add Assignment',
          onAdd: (String assignmentText) {
            setState(() {
              assignments.add(TodoItem(text: assignmentText, isDone: false));
            });
            Navigator.pop(context); // Close the bottom sheet
          },
        );
      },
    );
  }

  Widget _buildTodoList(String title, List<TodoItem> items) {
    List<TodoItem> undoneItems = items.where((item) => !item.isDone).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: undoneItems.map((item) => _buildTodoItem(item)).toList(),
        ),
      ],
    );
  }

  Widget _buildTodoItem(TodoItem todoItem) {
    return Row(
      children: [
        Checkbox(
          value: todoItem.isDone,
          onChanged: (bool? value) {
            setState(() {
              todoItem.isDone = value ?? false;
              if (todoItem.isDone) {
                todos.removeWhere((item) => item == todoItem);
                assignments.removeWhere((item) => item == todoItem);
              }
            });
          },
        ),
        Text(
          todoItem.text,
          style: TextStyle(
            fontSize: 18.0,
            decoration: todoItem.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
      ],
    );
  }

  Widget _buildItemList(String title, List<TodoItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) => Text('- ${item.text}')).toList(),
        ),
      ],
    );
  }
}

class FancyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  FancyButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class AddTodoItemBottomSheet extends StatefulWidget {
  final Function(String) onAdd;

  AddTodoItemBottomSheet({required this.onAdd});

  @override
  _AddTodoItemBottomSheetState createState() => _AddTodoItemBottomSheetState();
}

class _AddTodoItemBottomSheetState extends State<AddTodoItemBottomSheet> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Todo',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Enter todo...',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              String text = _textController.text.trim();
              if (text.isNotEmpty) {
                widget.onAdd(text);
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}

class AddItemBottomSheet extends StatefulWidget {
  final String title;
  final Function(String) onAdd;

  AddItemBottomSheet({required this.title, required this.onAdd});

  @override
  _AddItemBottomSheetState createState() => _AddItemBottomSheetState();
}

class _AddItemBottomSheetState extends State<AddItemBottomSheet> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Enter ${widget.title.toLowerCase()}...',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              String text = _textController.text.trim();
              if (text.isNotEmpty) {
                widget.onAdd(text);
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}

class TodoItem {
  String text;
  bool isDone;

  TodoItem({required this.text, required this.isDone});
}