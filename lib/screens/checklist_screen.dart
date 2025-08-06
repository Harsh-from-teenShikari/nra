import 'package:flutter/material.dart';

class ChecklistScreen extends StatefulWidget {
  @override
  _ChecklistScreenState createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  final List<String> checklist = [
    "Document procedure",
    "Monitor baby",
    "Clean equipment",
    "Communicate with family",
    "Debrief team",
  ];
  List<bool> checked = List.filled(5, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post-Procedure Checklist')),
      body: ListView(
        children: [
          ...List.generate(checklist.length, (i) {
            return CheckboxListTile(
              value: checked[i],
              title: Text(checklist[i], style: TextStyle(fontSize: 22)),
              onChanged: (val) {
                setState(() {
                  checked[i] = val ?? false;
                });
              },
            );
          }),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Save record logic
                Navigator.pop(context);
              },
              child: Text('Save Record', style: TextStyle(fontSize: 22)),
            ),
          ),
        ],
      ),
    );
  }
}
