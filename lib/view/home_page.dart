import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_state/bloc/task_bloc.dart';
import 'package:sqlite_state/bloc/task_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task  List")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDailog(context),
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<TaskBloc,TaskState>(
        builder: (context,state){
          if(state is TaskLoading){
            return CircularProgressIndicator();
          }else if(state is TaskLoad){
            if(state.tasks.isEmpty){
              return Center(child: Text("No Task yet"),);
            }

            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context,index){
                return ListTile(
                     title: Text(state.tasks[index].content),
                );
              }
            );
          }else if (state is TaskError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }       
        }
        
      ),
    );
  }

  void _showDailog(BuildContext context) {
    String content = "";
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Add task"),
            content: TextField(
              onChanged: (value) => content = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
            ],
          ),
    );
  }
}
