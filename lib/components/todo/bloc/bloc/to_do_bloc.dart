import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/components/todo/repository/todo_repository.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc(this._todoRepository) : super(ToDoInitial()) {
    on<ToDoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final TodoRepository _todoRepository;
}
//fsa