import 'package:equatable/equatable.dart';
import 'package:test_project/local_db/local_db.dart';

class CheckListItemModel extends Equatable {
  const CheckListItemModel(
      {required this.id,
      required this.toDoItemId,
      required this.title,
      required this.isDone});

  final int id;
  final int toDoItemId;
  final String title;
  final bool isDone;

  CheckListItemModel.fromLocal(CheckListData data)
      : id = data.id,
        toDoItemId = data.toDoItemId,
        title = data.title,
        isDone = data.isCompleted;

  @override
  // TODO: implement props
  List<Object?> get props => [id, toDoItemId, title, isDone];
}
