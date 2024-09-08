import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/components/todo/data/model/todo_model.dart';
import 'package:test_project/components/todo/repository/todo_repository.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final TodoRepository _toDoRepository;
  ToDoBloc({required TodoRepository toDoRepository})
      : _toDoRepository = toDoRepository,
        super(const ToDoState(status: ToDoStatus.initial)) {
    on<ToDoFetched>(_onToDoFetched);
  }

  Future<void> _onToDoFetched(
      ToDoFetched event, Emitter<ToDoState> emit) async {
    try {
      if (state.status == ToDoStatus.initial) {
        final toDoItems = await _toDoRepository.getToDoAll();
        log(toDoItems.toString());
        return emit(
            state.copyWith(status: ToDoStatus.success, toDoItems: toDoItems));
      }
    } catch (e) {
      log(e.toString(), name: "FROM TODOBLOC");
    }
  }

  Future<void> _UpdateToDoStatus(
      UpdateToDoStatus event, Emitter<ToDoState> emit) async {
    try {} catch (e) {}
  }
}
