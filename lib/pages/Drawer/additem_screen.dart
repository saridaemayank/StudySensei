import 'package:flutter/material.dart';
import 'package:study_sensei/components/fancy_button.dart';

class AddItemScreen extends StatefulWidget {
  final String title;

  AddItemScreen({required this.title});

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter ${widget.title.toLowerCase()}...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            FancyButton(
              label: 'Add ${widget.title}',
              onPressed: () {
                String text = _textController.text.trim();
                if (text.isNotEmpty) {
                  Navigator.pop(context, text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

