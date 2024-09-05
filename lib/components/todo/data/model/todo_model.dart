import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/local_db/local_db.dart';

class ToDoModel extends Equatable {
  const ToDoModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.isCompleted});

  ToDoModel.fromLocal(TodoItem data)
      : id = data.id,
        title = data.title,
        description = data.description,
        isCompleted = data.isCompleted;

  TodoItemsCompanion toToDoCompanion() {
    final titleCompanion = Value<String>(title);
    final descriptionCompanion = Value<String?>(description);
    final isCompletedCompanion = Value<bool>(isCompleted);
    return TodoItemsCompanion(
      id: const Value<int>(0),
      title: titleCompanion,
      description: descriptionCompanion,
      isCompleted: isCompletedCompanion,
    );
  }

  final int id;
  final String title;
  final String? description;
  final bool isCompleted;

  @override
  List<Object?> get props => [id, title, description, isCompleted];
}
