import 'package:equatable/equatable.dart';
import 'package:test_project/local_db/local_db.dart';

class RemindTimeModel extends Equatable {
  const RemindTimeModel(
      {required this.id, required this.toDoItemId, required this.remindTime});

  final int id;
  final int toDoItemId;
  final DateTime remindTime;

  RemindTimeModel.fromLocal(ReminderTimeData data)
      : id = data.id,
        toDoItemId = data.toDoItemId,
        remindTime = data.remindTime;

  @override
  // TODO: implement props
  List<Object?> get props => [id, toDoItemId, remindTime];
}
