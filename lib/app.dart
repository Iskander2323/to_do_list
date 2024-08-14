import 'package:flutter/material.dart';
import 'package:test_project/components/home_page.dart';
import 'package:test_project/components/todo/repository/todo_repository.dart';

class App extends StatelessWidget {
  const App({super.key, required this.todoRepository});
  final TodoRepository todoRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(todoRepository: todoRepository));
  }
}
