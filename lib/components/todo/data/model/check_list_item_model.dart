import 'package:equatable/equatable.dart';

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

  @override
  // TODO: implement props
  List<Object?> get props => [id, toDoItemId, title, isDone];
}
