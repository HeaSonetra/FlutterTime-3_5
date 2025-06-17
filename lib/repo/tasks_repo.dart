
import 'package:sqlite_state/model/task_model.dart';
import 'package:sqlite_state/service/database_service.dart';

class TasksRepo {
   final DatabaseService db=DatabaseService.instance;
  Future<List<TaskModel>> fetchTask()=>db.getTasks();

  Future<void>  addTask(String content) => db.addTask(content);
  Future<void>  updateTask(TaskModel task) => db.updateTask(task);
  Future<void>  deletTask(int id) => db.deleteTask(id);

  
}