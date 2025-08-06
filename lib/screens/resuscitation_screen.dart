import 'package:flutter/material.dart';
import 'dart:async';

class ResuscitationScreen extends StatefulWidget {
  @override
  _ResuscitationScreenState createState() => _ResuscitationScreenState();
}

class _ResuscitationScreenState extends State<ResuscitationScreen> {
  int seconds = 0;
  Timer? _timer;
  int step = 0;
  final List<String> prompts = [
    "Is the baby breathing or crying?\nIs there good tone?",
    "Provide warmth, clear airway, dry, stimulate. Start timer.",
    "After 30 sec: Is the baby breathing?\nIs HR > 100 bpm?",
    "If not, start Positive Pressure Ventilation (PPV).",
    "After 30 sec PPV: Reassess HR and breathing.",
    "If HR < 60, start chest compressions. Call for advanced help.",
    "Continue as per protocol...",
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
      });
      // Example: trigger step change at 30s, 60s
      if (seconds == 30 && step == 1) _nextStep();
      if (seconds == 60 && step == 3) _nextStep();
    });
  }

  void _nextStep() {
    if (step < prompts.length - 1) {
      setState(() {
        step++;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resuscitation Workflow')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              "Timer: ${seconds}s",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Center(
                child: Text(
                  prompts[step],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (step > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        step--;
                      });
                    },
                    child: Text('Back', style: TextStyle(fontSize: 20)),
                  ),
                ElevatedButton(
                  onPressed: _nextStep,
                  child: Text('Next', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {
                // TODO: Emergency override logic
              },
              child: Text('EMERGENCY', style: TextStyle(fontSize: 22)),
            ),
          ],
        ),
      ),
    );
  }
}
