part of 'to_do_bloc.dart';

enum ToDoStatus { initial, success, failure, loading }

final class ToDoState extends Equatable {
  const ToDoState({
    this.status = ToDoStatus.initial,
    this.toDoItems = const <ToDoModel>[],
  });

  final List<ToDoModel> toDoItems;
  final ToDoStatus status;

  ToDoState copyWith({ToDoStatus? status, List<ToDoModel>? toDoItems}) {
    return ToDoState(
        status: status ?? this.status, toDoItems: toDoItems ?? this.toDoItems);
  }

  @override
  List<Object> get props => [toDoItems, status];
}
