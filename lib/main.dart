import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_state/bloc/task_bloc.dart';
import 'package:sqlite_state/bloc/task_event.dart';
import 'package:sqlite_state/repo/tasks_repo.dart';
import 'package:sqlite_state/view/home_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:BlocProvider(
          create: (_)=>TaskBloc(TasksRepo())..add(LoadTask()),
          child: HomePage(),
        ),
    );
  }
}