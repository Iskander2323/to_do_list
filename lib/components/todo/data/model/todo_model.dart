import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/components/todo/data/model/check_list_item_model.dart';
import 'package:test_project/components/todo/data/model/remind_time_model.dart';
import 'package:test_project/local_db/local_db.dart';

enum Difficulty { trivial, easy, medium, hard }

class ToDoModel extends Equatable {
  const ToDoModel(
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

  ToDoModel.defaultModel()
      : id = 0,
        title = '',
        description = '',
        checkList = <CheckListItemModel>[],
        difficulty = Difficulty.easy,
        isCompleted = false,
        deadline = DateTime.now(),
        remindersTimeList = <RemindTimeModel>[],
        createdTime = DateTime.now();

  TodoItemsCompanion toToDoCompanion() {
    final titleCompanion = Value<String>(title);
    final descriptionCompanion = Value<String?>(description);
    final createdTimeCompanion = Value<DateTime>(createdTime);
    final deadlineCompanion = Value<DateTime?>(deadline);
    final difficultyCompanion = Value<Difficulty>(difficulty);
    final isCompletedCompanion = Value<bool>(isCompleted);
    return TodoItemsCompanion(
      title: titleCompanion,
      description: descriptionCompanion,
      difficulty: difficultyCompanion,
      isCompleted: isCompletedCompanion,
      deadLine: deadlineCompanion,
      createdTime: createdTimeCompanion,
    );
  }

  ToDoModel copyWith({
    int? id,
    String? title,
    String? description,
    List<CheckListItemModel>? checkList,
    Difficulty? difficulty,
    bool? isCompleted,
    DateTime? deadline,
    List<RemindTimeModel>? remindersTimeList,
    DateTime? createdTime,
  }) {
    return ToDoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        checkList: checkList ?? this.checkList,
        difficulty: difficulty ?? this.difficulty,
        isCompleted: isCompleted ?? this.isCompleted,
        deadline: deadline ?? this.deadline,
        remindersTimeList: remindersTimeList ?? this.remindersTimeList,
        createdTime: createdTime ?? this.createdTime);
  }

  final int id;
  final String title;
  final String? description;
  final List<CheckListItemModel>? checkList;
  final Difficulty difficulty;
  final bool isCompleted;
  final DateTime? deadline;
  final List<RemindTimeModel>? remindersTimeList;
  final DateTime createdTime;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
        checkList,
        difficulty,
        deadline,
        remindersTimeList,
        createdTime
      ];
}
