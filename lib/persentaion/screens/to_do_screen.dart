import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoly/data/task.dart';
import 'package:todoly/persentaion/screens/home_screen.dart';

class ToDoScreen extends StatelessWidget {
 List<Task>tasks;
   
ToDoScreen({Key? key, required this.tasks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    tasks=tasks.where((element) => element.isDone==false).toList();
    return ListView.builder(itemBuilder: (context,index){
      return ListTile(
        title: Text(tasks[index].taskName),
        
      );
    }
    ,itemCount: tasks.length,);
}
}