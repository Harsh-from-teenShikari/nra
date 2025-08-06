import 'package:hive/hive.dart';
import '../models/session.dart';

class LocalStorage {
  static Box<Session> getSessionBox() => Hive.box<Session>('sessions');

  static Future<void> saveSession(Session session) async {
    final box = getSessionBox();
    await box.add(session);
  }

  static List<Session> getAllSessions() {
    final box = getSessionBox();
    return box.values.toList();
  }
}
