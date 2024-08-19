import 'package:flutter/material.dart';

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
                            style: TextStyle(
                                color: Color.fromARGB(255, 216, 142, 205)),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                fillColor: Color.fromARGB(255, 216, 142, 205),
                                labelStyle: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 216, 142, 205))),
                          ),
                        ),
                        Container(
                          color: const Color.fromARGB(255, 58, 18, 83),
                          child: TextField(
                            maxLines: null,
                            minLines: 3,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                alignLabelWithHint: true,
                                fillColor: Color.fromARGB(255, 216, 142, 205),
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
