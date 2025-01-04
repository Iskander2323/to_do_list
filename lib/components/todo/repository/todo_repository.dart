import 'package:test_project/components/todo/data/model/todo_model.dart';
import 'package:test_project/local_db/globals.dart';
import 'package:test_project/local_db/local_db.dart';

class TodoRepository {
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
    await database.insertToDo(toDoItemCompanion);
  }

  Future<void> updateToDo(ToDoModel toDo) async {
    await database.updateToDo(toDo);
  }
}
