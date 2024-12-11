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
      {required this.toDoModel,
      this.status = FormToDoStatus.initial,
      this.chosenDifficulty = Difficulty.easy});

  FormToDoEditableState copyWith(
      {FormToDoStatus? status,
      ToDoModel? toDo,
      Difficulty? newChosenDifficulty}) {
    return FormToDoEditableState(
        status: status ?? this.status,
        toDoModel: toDoModel,
        chosenDifficulty: newChosenDifficulty ?? chosenDifficulty);
  }

  final ToDoModel toDoModel;
  final FormToDoStatus status;
  final Difficulty chosenDifficulty;

  @override
  List<Object> get props => [status, toDoModel, chosenDifficulty];
}
