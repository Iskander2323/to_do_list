import 'package:equatable/equatable.dart';

class RemindTimeModel extends Equatable {
  const RemindTimeModel(
      {required this.id, required this.toDoItemId, required this.remindTime});

  final int id;
  final int toDoItemId;
  final DateTime remindTime;

  @override
  // TODO: implement props
  List<Object?> get props => [id, toDoItemId, remindTime];
}
