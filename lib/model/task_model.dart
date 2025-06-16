

class TaskModel {
      int id;
      String content;
      int status;

  TaskModel({required this.id, required this.content, required this.status});

  factory TaskModel.fromMap(Map<String,dynamic> map){
    return TaskModel(
         id: ["id"] as int,
         content: ["content"] as String,
         status: ["status"] as int
    );
  }
}