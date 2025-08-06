import 'package:flutter/material.dart';
import 'resuscitation_screen.dart';
import 'checklist_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Neonatal Resuscitation Aid')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 60)),
              child: Text('Start Resuscitation', style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ResuscitationScreen()),
                );
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(200, 60)),
              child: Text('Post-Procedure Checklist', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ChecklistScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
