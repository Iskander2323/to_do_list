import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/components/form_to_do/bloc/form_to_do_bloc.dart';

class FormToDoPage extends StatefulWidget {
  const FormToDoPage({super.key});

  @override
  State<FormToDoPage> createState() => _FormToDoPageState();
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
                log(title);
                log(description);
                context.read<FormToDoBloc>().add(CreateToDoEvent(
                    taskTitle: title, description: description));
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
                      children: [],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
