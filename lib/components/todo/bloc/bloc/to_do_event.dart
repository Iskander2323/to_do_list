part of 'to_do_bloc.dart';

sealed class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

class ToDoFetched extends ToDoEvent {}

class AddToDo extends ToDoEvent {
  const AddToDo({required this.title, required this.description});
  final String title;
  final String description;
}

class EditToDo extends ToDoEvent {}

class DeleteToDo extends ToDoEvent {}
