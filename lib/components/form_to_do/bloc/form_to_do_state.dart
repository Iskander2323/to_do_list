part of 'form_to_do_bloc.dart';

sealed class FormToDoState extends Equatable {
  const FormToDoState();
  
  @override
  List<Object> get props => [];
}

final class FormToDoInitial extends FormToDoState {}
