import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_state/bloc/task_bloc.dart';
import 'package:sqlite_state/bloc/task_event.dart';
import 'package:sqlite_state/bloc/task_state.dart';
import 'package:sqlite_state/model/task_model.dart';

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
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoading) {
            return CircularProgressIndicator();
          } else if (state is TaskLoad) {
            if (state.tasks.isEmpty) {
              return Center(child: Text("No Task yet"));
            }

            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.tasks[index].content),
                  trailing: Wrap(
                    spacing: 2,
                    children: [
                      IconButton(
                        onPressed:
                            () => _showEditDailog(context, state.tasks[index]),
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<TaskBloc>().add(DeleteTask(state.tasks[index].id));
                        }, icon: Icon(Icons.delete)),
                    ],
                  ),
                );
              },
            );
          } else if (state is TaskError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
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
                  if (content.trim().isNotEmpty) {
                    context.read<TaskBloc>().add(AddTask(content));
                  }
                  Navigator.pop(context);
                },
                child: Text("Add"),
              ),
            ],
          ),
    );
  }

  void _showEditDailog(BuildContext context, TaskModel task) {
    final controller = TextEditingController(text: task.content);
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Edit task"),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  final updatedText = controller.text.trim();
                  if (updatedText.isNotEmpty) {
                    context.read<TaskBloc>().add(
                      UpdateTask(task.copyWith(content: updatedText)),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text('Update'),
              ),
            ],
          ),
    );
  }
}
