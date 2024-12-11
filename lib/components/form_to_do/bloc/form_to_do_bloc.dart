import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/components/todo/data/model/todo_model.dart';
import 'package:test_project/components/todo/repository/todo_repository.dart';

part 'form_to_do_event.dart';
part 'form_to_do_state.dart';

class FormToDoBloc extends Bloc<FormToDoEvent, FormToDoState> {
  final TodoRepository _toDoRepository;

  FormToDoBloc({required TodoRepository toDoRepository})
      : _toDoRepository = toDoRepository,
        super(const FormToDoState()) {
    on<FormFieldsToDoEvent>(_formToDo);
    on<CreateToDoEvent>(_createToDo);
    on<ChangeDifficultyEvent>(_changeDifficulty);
  }

  Future<void> _formToDo(
      FormFieldsToDoEvent event, Emitter<FormToDoState> emit) async {
    if (state.runtimeType == FormToDoState) {
      if (event.id != null) {
        final id = int.tryParse(event.id!) ?? 0;
        var toDoModel = await _toDoRepository.getToDoById(id);
        toDoModel ??= ToDoModel.defaultModel();
        emit(FormToDoEditableState(
            status: FormToDoStatus.edit, toDoModel: toDoModel));
      } else {
        final toDoModel = ToDoModel.defaultModel();
        emit(FormToDoEditableState(
            status: FormToDoStatus.success, toDoModel: toDoModel));
      }
    }
  }

  Future<void> _createToDo(
      CreateToDoEvent event, Emitter<FormToDoState> emit) async {
    _toDoRepository.insertOrUpdate(event.toDoModel);
  }

  Future<void> _changeDifficulty(
      ChangeDifficultyEvent event, Emitter<FormToDoState> emit) async {
    emit((state as FormToDoEditableState)
        .copyWith(newChosenDifficulty: event.chosenDifficulty));
  }
}
