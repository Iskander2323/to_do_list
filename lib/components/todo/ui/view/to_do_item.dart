import 'package:flutter/material.dart';
import 'package:test_project/components/todo/data/model/todo_model.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem({super.key, required this.todoItem});
  final ToDoModel todoItem;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: ColoredBox(
              color: widget.todoItem.isCompleted
                  ? Colors.greenAccent
                  : Colors.orangeAccent,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 10),
              width: 120,
              height: 50,
              child: Text(widget.todoItem.title)),
        ],
      ),
    );
  }
}
