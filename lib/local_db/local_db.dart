import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:test_project/components/todo/data/model/check_list_item_model.dart';
import 'package:test_project/components/todo/data/model/remind_time_model.dart';
import 'package:test_project/components/todo/data/model/todo_model.dart';
import 'package:test_project/local_db/globals.dart';

part 'local_db.g.dart';

class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get difficulty => textEnum<Difficulty>()();
  BoolColumn get isCompleted => boolean()();
  DateTimeColumn get deadLine => dateTime().nullable()();
  DateTimeColumn get createdTime => dateTime()();
}

class ReminderTime extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get toDoItemId => integer().references(TodoItems, #id)();
  DateTimeColumn get remindTime => dateTime()();
}

class CheckList extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get toDoItemId => integer().references(TodoItems, #id)();
  TextColumn get title => text()();
  BoolColumn get isCompleted => boolean()();
}

@DriftDatabase(tables: [TodoItems, ReminderTime, CheckList])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  Future<List<ToDoModel>> getAllToDoItems() async {
    var toDoItems = <TodoItem>[];
    try {
      toDoItems = await select(todoItems).get();
    } on Exception catch (e) {
      log(e.toString());
    }
    final result = <ToDoModel>[];
    for (var toDoItem in toDoItems) {
      final List<CheckListItemModel> checkList =
          await getCheckList(toDoItem.id);
      final List<RemindTimeModel> remindTimeList =
          await getReminderTimeList(toDoItem.id);
      result.add(ToDoModel.fromLocal(toDoItem, checkList, remindTimeList));
    }
    return result;
  }

  Future<List<CheckListItemModel>> getCheckList(int id) async {
    var checkLocalList = [];
    try {
      checkLocalList = await (select(checkList)
            ..where((tbl) => tbl.toDoItemId.equals(id)))
          .get();
    } on Exception catch (e) {
      log(e.toString(), name: 'FROM GET CHECKLIST');
    }
    final result = <CheckListItemModel>[];
    for (var element in checkLocalList) {
      result.add(CheckListItemModel.fromLocal(element));
    }
    return result;
  }

  Future<List<RemindTimeModel>> getReminderTimeList(int id) async {
    var reminderList = [];
    try {
      reminderList = await (select(reminderTime)
            ..where((tbl) => tbl.toDoItemId.equals(id)))
          .get();
    } on Exception catch (e) {
      log(e.toString(), name: 'FROM GET REMINDER LIST');
    }
    final result = <RemindTimeModel>[];
    for (var element in reminderList) {
      result.add(RemindTimeModel.fromLocal(element));
    }
    return result;
  }

  Future<void> insertReminderTime(int toDoItemId, DateTime remindTime) async {
    try {
      await database.into(reminderTime).insert(ReminderTimeCompanion(
            id: const Value<int>(0),
            toDoItemId: Value<int>(toDoItemId),
            remindTime: Value<DateTime>(remindTime),
          ));
    } on Exception catch (e) {
      log(e.toString(), name: 'FROM INSERT REMINDER');
    }
  }

  Future<void> insertCheckList(int toDoItemId, String checkListText) async {
    try {
      await database.into(checkList).insert(CheckListCompanion(
          id: const Value<int>(0),
          toDoItemId: Value<int>(toDoItemId),
          title: Value<String>(checkListText),
          isCompleted: const Value<bool>(false)));
    } on Exception catch (e) {
      log(e.toString(), name: 'FROM INSERT CHECKLISTTEXT');
    }
  }

  Future<void> updateCheckListItemStatus(
      int toDoItemId, int checkListItemId, bool isDone) async {
    try {
      await (update(checkList)
            ..where((tbl) =>
                tbl.toDoItemId.equals(toDoItemId) &
                tbl.id.equals(checkListItemId)))
          .write(CheckListCompanion(isCompleted: Value<bool>(isDone)));
    } on Exception catch (e) {
      log(e.toString(), name: 'FROM UPDATE CHECKLISTITEM STATUS');
    }
  }

  Future<void> updateToDoStatus(int id, bool isDone) async {
    try {
      await (update(todoItems)..where((tbl) => tbl.id.equals(id)))
          .write(TodoItemsCompanion(isCompleted: Value<bool>(isDone)));
    } on Exception catch (e) {
      log(e.toString(), name: 'FROM UPDATE TODOSTATUS');
    }
  }

  Future<void> insertOrUpdateToDo(TodoItemsCompanion toDoItemCompanion) async {
    try {
      final isRecordExist = await (select(todoItems)
            ..where((tbl) => tbl.id.equals(toDoItemCompanion.id.value)))
          .getSingleOrNull();
      if (isRecordExist == null) {
        try {
          await database.into(todoItems).insert(toDoItemCompanion);
        } on Exception catch (e) {
          log(e.toString());
        }
      } else {
        try {
          await (update(todoItems)
                ..where((tbl) => tbl.id.equals(toDoItemCompanion.id.value)))
              .write(toDoItemCompanion);
        } on Exception catch (e) {
          log(e.toString(), name: 'FROM UPDATE TODO');
        }
      }
    } on Exception catch (e) {
      log(e.toString(), name: 'FROM INSERT TODO');
    }
  }

  Future<void> deleteAllToDo() async {
    await delete(todoItems).go();
  }

  Future<void> deleteToDoItemById(int id) async {
    await (delete(todoItems)..where((tbl) => tbl.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
