

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_state/bloc/task_event.dart';
import 'package:sqlite_state/bloc/task_state.dart';
import 'package:sqlite_state/repo/tasks_repo.dart';

class TaskBloc extends  Bloc<TaskEvent,TaskState>  {
   final TasksRepo repo;

 
  TaskBloc(this.repo):super(TaskLoading()){
    on<LoadTask>((event,emit)async{
        emit(TaskLoading());
        try{
            final tasks=await repo.fetchTask();
            emit(TaskLoad(tasks)) ;
        }catch(e){
            emit(TaskError("Fail get table"));
        }
    }
    
     
    );

    on<AddTask>  ((event,emit) async{
        await repo.addTask(event.content);
        add(LoadTask());
    });
    
  }
}