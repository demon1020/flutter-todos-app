import 'package:hive/hive.dart';

part 'todo_adapter_model.g.dart';

//Command to generate adapter class from build_runner
//flutter packages pub run build_runner build --delete-conflicting-outputs

@HiveType(typeId: 0)
class Todo extends HiveObject{
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  Todo({required this.title, required this.description});
}
