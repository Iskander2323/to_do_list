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
    on<UpdateToDoStatus>(_updateToDoStatus);
  }

  Future<void> _onToDoFetched(
      ToDoFetched event, Emitter<ToDoState> emit) async {
    try {
      if (state.status == ToDoStatus.initial) {
        final toDoItems = await _toDoRepository.getToDoAll();
        emit(state.copyWith(status: ToDoStatus.success, toDoItems: toDoItems));
      } else if (state.status == ToDoStatus.success) {
        final toDoItems = await _toDoRepository.getToDoAll();
        emit(state.copyWith(status: ToDoStatus.success, toDoItems: toDoItems));
      }
      await emit.forEach(_toDoRepository.newCreatedToDo, onData: (toDo) {
        final toDoList = List<ToDoModel>.from(state.toDoItems)..add(toDo);
        return ToDoState(
            status: ToDoStatus.success,
            toDoItems: List<ToDoModel>.from(toDoList));
      });
    } catch (e) {
      log(e.toString(), name: "FROM TODOBLOC");
    }
  }

  Future<void> _updateToDoStatus(
      UpdateToDoStatus event, Emitter<ToDoState> emit) async {
    await _toDoRepository.updateToDoStatus(event.toDoId, event.isCompleted);

    final updatedList = state.toDoItems.map((toDo) {
      if (toDo.id == event.toDoId) {
        return toDo.copyWith(isCompleted: event.isCompleted);
      }
      return toDo;
    }).toList();
    emit(state.copyWith(toDoItems: updatedList));
  }
}
