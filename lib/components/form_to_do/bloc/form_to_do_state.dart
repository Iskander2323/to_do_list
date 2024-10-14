part of 'form_to_do_bloc.dart';

enum FormToDoStatus {
  initial,
  edit,
  saving,
  success,
  failure,
}

class FormToDoState extends Equatable {
  const FormToDoState();

  @override
  List<Object> get props => [];
}

final class FormToDoEditableState extends FormToDoState {
  FormToDoEditableState(
      {required this.toDoModel, this.status = FormToDoStatus.initial});

  FormToDoEditableState copyWith({
    required FormToDoStatus status,
    required ToDoModel toDo,
  }) {
    return FormToDoEditableState(status: status, toDoModel: toDoModel);
  }

  final ToDoModel toDoModel;
  final FormToDoStatus status;
}
