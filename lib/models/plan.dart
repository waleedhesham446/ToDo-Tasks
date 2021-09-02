import './task.dart';

class Plan {
  String name = '';
  final List<Task> tasks = [];

  int get completeCount => tasks.where((task) => task.completed).length;

  String get completenessMessage => '$completeCount out of ${tasks.length} tasks';
}
