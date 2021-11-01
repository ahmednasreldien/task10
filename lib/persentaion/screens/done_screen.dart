import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:todoly/data/task.dart';
import 'package:todoly/persentaion/screens/add_task_screen.dart';

class DoneScreen extends StatelessWidget {
  List<Task> tasks;
  AddTaskScreen addtask=AddTaskScreen();
   DoneScreen({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tasks=tasks.where( (element)=>element.isDone== true).toList();
    return ListView.builder(itemBuilder: (context,index){
      return ListTile(
        title: Text(tasks[index].taskName),
        subtitle: Text(DateFormat("dd/MM/ hh:mm").format(tasks[index].dueDate!)),
        trailing: Text(DateFormat("dd/MM/ hh:mm").format(tasks[index].doneTime!)),

      );
    },itemCount: tasks.length,);
  }
}
