import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_to_do_event.dart';
part 'form_to_do_state.dart';

class FormToDoBloc extends Bloc<FormToDoEvent, FormToDoState> {
  FormToDoBloc() : super(FormToDoInitial()) {
    on<FormToDoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
