import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/components/todo/data/model/check_list_item_model.dart';
import 'package:test_project/components/todo/data/model/remind_time_model.dart';
import 'package:test_project/local_db/local_db.dart';

enum Difficulty { trivial, easy, medium, hard }

class ToDoModel extends Equatable {
  ToDoModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.checkList,
      required this.isCompleted,
      required this.difficulty,
      required this.deadline,
      required this.remindersTimeList,
      required this.createdTime});

  ToDoModel.fromLocal(TodoItem data, this.checkList, this.remindersTimeList)
      : id = data.id,
        title = data.title,
        description = data.description,
        isCompleted = data.isCompleted,
        difficulty = data.difficulty,
        deadline = data.deadLine,
        createdTime = data.createdTime;

  TodoItemsCompanion toToDoCompanion() {
    final titleCompanion = Value<String>(title);
    final descriptionCompanion = Value<String?>(description);
    final createdTimeCompanion = Value<DateTime>(createdTime);
    final deadlineCompanion = Value<DateTime>(deadline);
    final difficultyCompanion = Value<Difficulty>(difficulty);
    final isCompletedCompanion = Value<bool>(isCompleted);
    return TodoItemsCompanion(
      id: const Value<int>(0),
      title: titleCompanion,
      description: descriptionCompanion,
      difficulty: difficultyCompanion,
      isCompleted: isCompletedCompanion,
      deadLine: deadlineCompanion,
      createdTime: createdTimeCompanion,
    );
  }

  final int id;
  final String title;
  final String? description;
  final List<CheckListItemModel> checkList;
  final Difficulty difficulty;
  final bool isCompleted;
  final DateTime deadline;
  final List<RemindTimeModel> remindersTimeList;
  final DateTime createdTime;

  @override
  List<Object?> get props => [id, title, description, isCompleted];
}
