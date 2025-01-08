import 'dart:async';

import 'package:test_project/components/todo/data/model/todo_model.dart';
import 'package:test_project/local_db/globals.dart';
import 'package:test_project/local_db/local_db.dart';

class TodoRepository {
  final StreamController<ToDoModel> _newCreatedToDoStreamController =
      StreamController<ToDoModel>.broadcast();

  Stream get newCreatedToDo => _newCreatedToDoStreamController.stream;

  Future<List<ToDoModel>> getToDoAll() async {
    final toDoItems = await database.getAllToDoItems();
    return toDoItems;
  }

  Future<ToDoModel?> getToDoById(int id) async {
    final ToDoModel? toDoModel = await database.getToDoById(id);
    return toDoModel;
  }

  Future<void> insertToDo(ToDoModel toDo) async {
    final toDoItemCompanion = toDo.toToDoCompanion();
    final int? insertedToDoId = await database.insertToDo(toDoItemCompanion);
    if (insertedToDoId != null) {
      final insertedToDoModel = toDo.copyWith(id: insertedToDoId);
      _newCreatedToDoStreamController.add(insertedToDoModel);
    }
  }

  Future<void> updateToDo(ToDoModel toDo) async {
    await database.updateToDo(toDo);
  }
}
