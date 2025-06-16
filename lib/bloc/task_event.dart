

abstract class TaskEvent {}

class LoadTask extends TaskEvent{}


class AddTask extends TaskEvent{
  final String content;
  AddTask(this.content);
}