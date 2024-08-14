part of 'to_do_bloc.dart';

enum status { initial, success, failire, loading }

sealed class ToDoState extends Equatable {
  const ToDoState();

  @override
  List<Object> get props => [];
}

final class ToDoInitial extends ToDoState {}
