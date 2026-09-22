import 'package:flutter/material.dart';

class CommonUIFixes extends StatefulWidget {
  const CommonUIFixes({super.key});

  @override
  State<CommonUIFixes> createState() => _CommonUIFixesState();
}

class _CommonUIFixesState extends State<CommonUIFixes> {
  int _counter = 0;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Exercise 5 – Common UI Fixes'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Correct ListView inside Column using Expanded',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ListTile(leading: Icon(Icons.movie), title: Text('Movie A')),
                ListTile(leading: Icon(Icons.movie), title: Text('Movie B')),
                ListTile(leading: Icon(Icons.movie), title: Text('Movie C')),
                ListTile(leading: Icon(Icons.movie), title: Text('Movie D')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
