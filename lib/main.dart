import 'package:flutter/material.dart';
import 'package:test_project/app.dart';
import 'package:test_project/components/todo/repository/todo_repository.dart';

void main() {
  TodoRepository todoRepository = TodoRepository();
  runApp(App(todoRepository: todoRepository));
}
