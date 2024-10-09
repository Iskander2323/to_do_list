import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/components/form_to_do/bloc/form_to_do_bloc.dart';
import 'package:test_project/components/todo/data/model/check_list_item_model.dart';
import 'package:test_project/components/todo/data/model/remind_time_model.dart';
import 'package:test_project/components/todo/data/model/todo_model.dart';

class FormToDoPage extends StatefulWidget {
  const FormToDoPage({super.key});

  @override
  State<FormToDoPage> createState() => _FormToDoPageState();
}

Widget _diffucultyButton(String difficultyTitle) {
  return Column(
    children: [
      ElevatedButton.icon(
        onPressed: () {},
        label: Icon(Icons.add),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(
              50,
              70,
            ),
            backgroundColor: Color.fromARGB(255, 58, 18, 83),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
      Text(
        difficultyTitle,
        style: TextStyle(color: Color.fromARGB(255, 216, 142, 205)),
      )
    ],
  );
}

class _FormToDoPageState extends State<FormToDoPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create to do',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                final title = titleController.text;
                final description = descriptionController.text;
                final ToDoModel toDoModel = ToDoModel(
                    id: 0,
                    title: title,
                    description: description,
                    checkList: <CheckListItemModel>[],
                    isCompleted: false,
                    difficulty: Difficulty.easy,
                    deadline: DateTime.now(),
                    remindersTimeList: <RemindTimeModel>[],
                    createdTime: DateTime.now());
                context
                    .read<FormToDoBloc>()
                    .add(CreateToDoEvent(toDoModel: toDoModel));
                Navigator.pop(context);
              },
              child: Text(
                'CREATE',
                style: TextStyle(color: Colors.white),
              ))
        ],
        backgroundColor: const Color.fromARGB(255, 105, 39, 176),
      ),
      backgroundColor: const Color.fromARGB(255, 105, 39, 176),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          color: const Color.fromARGB(255, 58, 18, 83),
                          child: TextField(
                            controller: titleController,
                            style: TextStyle(
                                color: Color.fromARGB(255, 216, 142, 205)),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                labelText: 'Task Title',
                                labelStyle: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 216, 142, 205))),
                          ),
                        ),
                        Container(
                          color: const Color.fromARGB(255, 58, 18, 83),
                          child: TextField(
                            controller: descriptionController,
                            maxLines: null,
                            minLines: 3,
                            style: TextStyle(
                              color: Color.fromARGB(255, 216, 142, 205),
                            ),
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                alignLabelWithHint: true,
                                labelText: 'Notes',
                                labelStyle: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 216, 142, 205))),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.7,
                    padding: EdgeInsets.all(20),
                    color: Colors.black,
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Difficulty',
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _diffucultyButton('Trivial'),
                                  _diffucultyButton('Easy'),
                                  _diffucultyButton('Medium'),
                                  _diffucultyButton('Hard'),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
