

class TaskModel {
      int id;
      String content;
      int status;

  TaskModel({required this.id, required this.content, required this.status});

  factory TaskModel.fromMap(Map<String,dynamic> map){
    return TaskModel(
         id: map["id"] as int,
         content: map["content"] as String,
         status: map["status"] as int
    );
  }

  Map<String , dynamic>  toMap(){
    return {
        'id': id,
        'content': content,
        'status': status,
    };
  }
  TaskModel copyWith({int? id, String? content, int? status}) {
    return TaskModel(
      id: id ?? this.id,
      content: content ?? this.content,
      status: status ?? this.status,
    );
  }
}