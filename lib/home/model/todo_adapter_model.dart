import 'package:hive/hive.dart';

part 'todo_adapter.g.dart';

@HiveType(typeId : 0)
class Todo{
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String description;

  Todo({required this.title, required this.description});
}