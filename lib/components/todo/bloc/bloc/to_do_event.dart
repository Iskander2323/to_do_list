part of 'to_do_bloc.dart';

sealed class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

final class ToDoFetched extends ToDoEvent {}

final class AddToDo extends ToDoEvent {
  const AddToDo({required this.title, required this.description});
  final String title;
  final String description;
}

final class UpdateToDoStatus extends ToDoEvent {
  const UpdateToDoStatus({required this.toDoId, required this.isDone});
  final int toDoId;
  final bool isDone;
}

final class EditToDo extends ToDoEvent {}

final class DeleteToDo extends ToDoEvent {}
