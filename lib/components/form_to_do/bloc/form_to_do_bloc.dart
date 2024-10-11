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
        super(FormToDoInitial()) {
    on<FormToDoEvent>((event, emit) {});
    on<CreateToDoEvent>(_createToDo);
  }

  Future<void> _createToDo(
      CreateToDoEvent event, Emitter<FormToDoState> emit) async {
    _toDoRepository.insertOrUpdate(event.toDoModel);
  }

  Future<void> _changeDifficulty() async {}
}
