import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflit_playground/models/task.dart';
import 'package:sqflit_playground/providers/object_provider.dart';
import 'package:sqflit_playground/providers/task_provider.dart';
import 'package:sqflit_playground/screens/task_form_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile(this.task, {super.key});

  void _onCheck(BuildContext context) {
    task.toggleCompleted();
    Provider.of<ObjectProvider<Task>>(context, listen: false)
        .updateObject(task);
  }

  void _onDelete(BuildContext context) {
    Provider.of<ObjectProvider<Task>>(context, listen: false)
        .deleteObject(task.id);
  }

  void _onUpdate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskFormScreen(task: task),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        color: Colors.blueGrey[50],
        child: ListTile(
          title: Text(
            task.title,
            style: TextStyle(
              decoration:
                  task.isCompleted != 0 ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(task.description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  _onCheck(context);
                },
                icon: const Icon(Icons.check),
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  _onUpdate(context);
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  _onDelete(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
