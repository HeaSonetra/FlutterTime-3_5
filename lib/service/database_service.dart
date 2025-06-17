import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqlite_state/model/task_model.dart';

class DatabaseService  {
  static final DatabaseService instance=DatabaseService._();
  static Database? _db;
  final _table="tasks";
  
  DatabaseService._();
  Future<Database>  get db async{
    if(_db!=null)return _db!;
    final path=join(await getDatabasesPath(),"task_state.db");
    _db=await openDatabase(path,version: 1,onCreate:_onCreate);
    return _db!;
  }

  void _onCreate(Database db,int version)async{
       await db.execute("""
            CREATE TABLE $_table(
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    content TEXT NOT NULL,
                    status INTEGER NOT NULL
            )
""");
  }
   
   Future<List<TaskModel>> getTasks()async{
     final database=await db;
     final result=await database.query(_table);
     //await database.delete(_table);
     return result.map((e) => TaskModel.fromMap(e)).toList();
   }

    Future<void> addTask(String content) async {
    final database = await db;
    await database.insert(_table, {
      'content': content,
      'status': 0,
    });
  }
  Future<void> updateTask(TaskModel task) async {
    final database = await db;
    await database.update(_table, task.toMap(),where: "id=?",whereArgs: [task.id]);
  }
  Future<void> deleteTask(int id) async {
    final database = await db;
    await database.delete(_table,where: "id=?",whereArgs: [id]);
  }
  
}