import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/components/form_to_do/bloc/form_to_do_bloc.dart';
import 'package:test_project/components/form_to_do/ui/form_to_do_fields_page.dart';
import 'package:test_project/components/todo/bloc/bloc/to_do_bloc.dart';

class FormToDoPage extends StatefulWidget {
  const FormToDoPage({super.key});

  @override
  State<FormToDoPage> createState() => _FormToDoPageState();
}

class _FormToDoPageState extends State<FormToDoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormToDoBloc, FormToDoState>(builder: (context, state) {
      if (state.runtimeType == FormToDoEditableState) {
        switch ((state as FormToDoEditableState).status) {
          case FormToDoStatus.success:
            return FormToDoFieldsPage(toDoModel: (state).toDoModel);
          case FormToDoStatus.edit:
            return FormToDoFieldsPage(
              toDoModel: (state).toDoModel,
              isEditing: true,
            );
          case FormToDoStatus.initial:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case FormToDoStatus.saving:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case FormToDoStatus.failure:
            return const Center(
              child: Text('ERROR SOMETHING WENT WRONG FAILURE'),
            );

          default:
            return const Center(
              child: Text('ERROR SOMETHING WENT WRONG DEFAULT'),
            );
        }
      } else {
        return const Center(
          child: Text('ERROR SOMETHING WENT WRONG ELSE EXCEPTION'),
        );
      }
    });
  }
}
