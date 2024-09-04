import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:test_project/components/todo/data/model/todo_model.dart';
import 'package:test_project/local_db/globals.dart';

part 'local_db.g.dart';

class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6)();
  TextColumn get description => text().nullable()();
  BoolColumn get isCompleted => boolean()();
}

@DriftDatabase(tables: [TodoItems])
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
      result.add(ToDoModel.fromLocal(toDoItem));
    }
    return result;
  }

  Future<void> insertOrUpdateToDo(TodoItemsCompanion toDoItemCompanion) async {
    try {
      final isRecordExist = await (select(todoItems)
            ..where((tbl) => tbl.id.equals(toDoItemCompanion.id.value)))
          .getSingleOrNull();
      if (isRecordExist == null) {
        try {
          await database.into(todoItems).insert(toDoItemCompanion);
          log('CREATED SUCCESSFULLY');
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
