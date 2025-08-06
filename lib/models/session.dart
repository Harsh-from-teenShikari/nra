import 'package:hive/hive.dart';

part 'session.g.dart';

@HiveType(typeId: 0)
class Session extends HiveObject {
  @HiveField(0)
  late DateTime timestamp;

  @HiveField(1)
  late List<String> steps;

  @HiveField(2)
  late List<String> notes;

  Session({required this.timestamp, required this.steps, required this.notes});
}
