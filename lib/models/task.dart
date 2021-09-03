import 'package:flutter/foundation.dart';
import '../repositories/repository.dart';

class Task {
  final int id;
  String description;
  bool completed;

  Task({
    @required this.id,
    this.completed = false,
    this.description = '',
  });

  Task.fromModel(Model model)
      : id = model.id,
        description = model.data['description'],
        completed = model.data['completed'];

  Model toModel() => Model(id: id, data: {
        'description': description,
        'completed': completed,
      });
}
