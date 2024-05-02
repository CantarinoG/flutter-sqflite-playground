import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflit_playground/models/task.dart';
import 'package:sqflit_playground/providers/task_provider.dart';
import 'package:sqflit_playground/screens/task_form_screen.dart';
import 'package:sqflit_playground/widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  void onFabPressed(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = [];
    TaskProvider provider = Provider.of<TaskProvider>(context);
    tasks = provider.tasks;
    if (tasks.isEmpty) {
      provider.loadTasks();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
        backgroundColor: Colors.lightBlue[100],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onFabPressed(context);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (ctx, index) => TaskTile(tasks[index]),
      ),
    );
  }
}