

import 'package:sqlite_state/model/task_model.dart';

abstract class TaskState {}

class TaskLoading extends TaskState{}

class TaskLoad extends TaskState{
  final List<TaskModel>  tasks;
  TaskLoad(this.tasks);
}

class TaskError extends TaskState{
      final String message;
      TaskError(this.message);
}