import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/components/form_to_do/bloc/form_to_do_bloc.dart';
import 'package:test_project/components/todo/data/model/check_list_item_model.dart';
import 'package:test_project/components/todo/data/model/remind_time_model.dart';
import 'package:test_project/components/todo/data/model/todo_model.dart';

class FormToDoFieldsPage extends StatefulWidget {
  final ToDoModel toDoModel;
  final bool? isEditing;
  const FormToDoFieldsPage(
      {super.key, required this.toDoModel, this.isEditing});
  @override
  State<FormToDoFieldsPage> createState() => _FormToDoFieldsPageState();
}

class _FormToDoFieldsPageState extends State<FormToDoFieldsPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget diffucultyButton(String difficultyTitle, Difficulty difficulty) {
      return Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              final Difficulty newChosenDifficulty = Difficulty.values
                  .firstWhere((element) =>
                      element.name == difficultyTitle.toLowerCase());
              context.read<FormToDoBloc>().add(
                  ChangeDifficultyEvent(chosenDifficulty: newChosenDifficulty));
              log(newChosenDifficulty.name, name: 'NEW CHOSEN DIFFICULTY');
            },
            label: const Icon(Icons.add),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  50,
                  70,
                ),
                backgroundColor: difficultyTitle.toLowerCase() ==
                        difficulty.name.toLowerCase()
                    ? const Color.fromARGB(255, 188, 108, 238)
                    : const Color.fromARGB(255, 58, 18, 83),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
          ),
          Text(
            difficultyTitle,
            style: const TextStyle(color: Color.fromARGB(255, 216, 142, 205)),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create to do',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
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
          return BlocBuilder<FormToDoBloc, FormToDoState>(
            builder: (context, state) {
              return SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              color: const Color.fromARGB(255, 58, 18, 83),
                              child: TextField(
                                controller: titleController,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 216, 142, 205)),
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    labelText: 'Task Title',
                                    labelStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 216, 142, 205))),
                              ),
                            ),
                            Container(
                              color: const Color.fromARGB(255, 58, 18, 83),
                              child: TextField(
                                controller: descriptionController,
                                maxLines: null,
                                minLines: 3,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 216, 142, 205),
                                ),
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    alignLabelWithHint: true,
                                    labelText: 'Notes',
                                    labelStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 216, 142, 205))),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.7,
                        padding: const EdgeInsets.all(20),
                        color: Colors.black,
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          'Difficulty',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            diffucultyButton(
                                                'Trivial',
                                                (state as FormToDoEditableState)
                                                    .chosenDifficulty),
                                            diffucultyButton(
                                                'Easy',
                                                (state as FormToDoEditableState)
                                                    .chosenDifficulty),
                                            diffucultyButton(
                                                'Medium',
                                                (state as FormToDoEditableState)
                                                    .chosenDifficulty),
                                            diffucultyButton(
                                                'Hard',
                                                (state as FormToDoEditableState)
                                                    .chosenDifficulty),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    'Scheduling',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                      width: constraints.maxWidth,
                                      height: constraints.maxHeight * 0.09,
                                      child: TextField(
                                        controller: dateTimeController,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration: const InputDecoration(
                                            labelText: 'Due Date',
                                            fillColor: Colors.white),
                                        readOnly: true,
                                        onTap: () {},
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ));
            },
          );
        },
      ),
    );
  }
}
