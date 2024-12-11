import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/components/form_to_do/bloc/form_to_do_bloc.dart';
import 'package:test_project/components/form_to_do/ui/form_to_do_page.dart';
import 'package:test_project/components/todo/repository/todo_repository.dart';

class FormBlocPage extends StatelessWidget {
  const FormBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            FormToDoBloc(toDoRepository: context.read<TodoRepository>())
              ..add(const FormFieldsToDoEvent()),
        child: const FormToDoPage(),
      ),
    );
  }
}
