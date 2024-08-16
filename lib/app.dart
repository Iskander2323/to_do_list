import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/components/todo/bloc/bloc/to_do_bloc.dart';
import 'package:test_project/components/todo/repository/todo_repository.dart';
import 'package:test_project/routes.dart';

class App extends StatelessWidget {
  const App({super.key, required this.toDoRepository});

  final TodoRepository toDoRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider(
            create: (context) => ToDoBloc(toDoRepository: toDoRepository))
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: routes,
        // home: HomePage(todoRepository: todoRepository)
      ),
    );
  }
}
