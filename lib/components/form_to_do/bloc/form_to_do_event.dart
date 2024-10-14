part of 'form_to_do_bloc.dart';

sealed class FormToDoEvent extends Equatable {
  const FormToDoEvent();

  @override
  List<Object> get props => [];
}

final class FormFieldsToDoEvent extends FormToDoEvent {
  const FormFieldsToDoEvent({this.id});
  final String? id;
}

final class CreateToDoEvent extends FormToDoEvent {
  const CreateToDoEvent({required this.toDoModel});

  final ToDoModel toDoModel;
}

final class ChangeDifficultyEvent extends FormToDoEvent {}
