import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/home_screen.dart';
import 'models/session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SessionAdapter());
  await Hive.openBox<Session>('sessions');
  runApp(NeonatalResuscitationAidApp());
}

class NeonatalResuscitationAidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neonatal Resuscitation Aid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline4: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 20.0),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
