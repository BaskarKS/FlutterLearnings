import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey_flutter/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Bread'),
  ];

  int get taskCount => _tasks.length;
  bool getTaskState(int index) => _tasks[index].isDone;
  String getTaskName(int index) => _tasks[index].name;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(
      _tasks); // will share the list but cant add items to list

  void addTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
