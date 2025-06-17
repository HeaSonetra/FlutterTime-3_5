

import 'package:sqlite_state/model/task_model.dart';

abstract class TaskEvent {}

class LoadTask extends TaskEvent{}


class AddTask extends TaskEvent{
  final String content;
  AddTask(this.content);
}

class UpdateTask extends TaskEvent{
  final TaskModel task;
  UpdateTask(this.task);
}
class DeleteTask extends TaskEvent{
  final int id;
  DeleteTask(this.id);
}