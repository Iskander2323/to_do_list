import 'package:flutter/material.dart';
import 'package:test_project/components/todo/bloc/bloc/to_do_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/components/todo/ui/view/to_do_list.dart';

class ToDoListPage extends StatelessWidget {
  const ToDoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<ToDoBloc>(context)..add(ToDoFetched()),
      child: const ToDoList(),
    );
  }
}
