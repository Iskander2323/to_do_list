import 'package:test_project/components/todo/data/model/todo_model.dart';
import 'package:test_project/local_db/globals.dart';

class TodoRepository {
  Future<List<ToDoModel>> getToDoAll() async {
    final toDoItems = await database.getAllToDoItems();
    return toDoItems;
  }

  Future<ToDoModel?> getToDoById(int id) async {
    final ToDoModel? toDoModel = await database.getToDoById(id);
    return toDoModel;
  }

  Future<void> insertOrUpdate(ToDoModel toDoItem) async {
    final toDoItemCompanion = toDoItem.toToDoCompanion();
    //TODO fix this bug
    await database.insertOrUpdateToDo(toDoItemCompanion);
  }
}
