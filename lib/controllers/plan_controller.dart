import '../models/data_layer.dart';

class PlanController {
  final _plans = <Plan>[];

  // This public getter cannot be modified by any other object
  List<Plan> get plans => List.unmodifiable(_plans);

  void addNewPlan(String name) {
    if (name.isEmpty) {
      return;
    }

    name = _checkForDuplicates(_plans.map((plan) => plan.name), name);

    final plan = Plan()..name = name;
    _plans.add(plan);
  }

  void deletePlan(Plan plan) {
    _plans.remove(plan);
  }

  void createNewTask(Plan plan, [String description]) {
    if (description == null || description == '') {
      description = 'New Task';
    }

    description = _checkForDuplicates(plan.tasks.map((task) => task.description), description);

    final task = Task()..description = description;
    plan.tasks.add(task);
  }

  void deleteTask(Plan plan, Task task) {
    plan.tasks.remove(task);
  }

  String _checkForDuplicates(Iterable<String> items, String text) {
    final dupllicatedCount = items.where((item) => item.contains(text)).length;

    if (dupllicatedCount > 0) {
      text += '${dupllicatedCount + 1}';
    }

    return text;
  }
}
