import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/components/todo/bloc/bloc/to_do_bloc.dart';
import 'package:test_project/components/todo/ui/view/to_do_item.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('RealLifeRPG'),
      ),
      body: LayoutBuilder(
        builder: (context, contrains) {
          return BlocBuilder<ToDoBloc, ToDoState>(builder: (context, state) {
            switch (state.status) {
              case ToDoStatus.initial:
                return const CircularProgressIndicator();
              case ToDoStatus.loading:
                return const CircularProgressIndicator();
              case ToDoStatus.failire:
                return const Center(child: Text('ERROR'));
              case ToDoStatus.success:
                if (state.toDoItems.isNotEmpty) {
                  final body = Container(
                    width: contrains.maxWidth,
                    height: contrains.maxHeight,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ToDoItem(todoItem: state.toDoItems[index]);
                      },
                      itemCount: state.toDoItems.length,
                    ),
                  );
                  return body;
                } else {
                  return Center(child: Text('ADD QUESTS'));
                }
                ;
              default:
                return const Center(child: Text('ERROR'));
            }
          });
        },
      ),
    );
  }
}
