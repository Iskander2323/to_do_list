import 'package:flutter/material.dart';
import 'package:test_project/components/todo/bloc/bloc/to_do_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/components/todo/repository/todo_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.todoRepository});
  final TodoRepository todoRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 173, 142),
          title: const Text('RealLifeRPG'),
        ),
        body: BlocProvider(
          create: (context) => ToDoBloc(todoRepository),
          child: Container(),
        ));
  }
}
