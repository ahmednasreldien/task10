import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:todoly/data/task.dart';

class AddTaskScreen extends StatefulWidget {
  
  AddTaskScreen({
    Key? key,
     
  }) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();

}

class _AddTaskScreenState extends State<AddTaskScreen> {
  List<Task> ?tasks;
TextEditingController textNameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Add Text")
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Expanded(
            child: Column(
              children: [
                TextField(
                  controller:textNameController,
                 onSubmitted: (text){
                     if(textNameController.text!=""){
                Navigator.of(context).pop(textNameController.text);}
                 },
                  decoration: InputDecoration(
                    hintText: "Enter Task Name",
                    label: Text("Task Name"),
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color:Theme.of(context).colorScheme.secondary,width: 2,)
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                TextButton(onPressed: ()async{
                  final initialDate=DateTime.now();
                  final newDate= await showDatePicker(
                     context: context,
                     initialDate: initialDate,
                     firstDate: DateTime(DateTime.now().year-5),
                     lastDate:DateTime(DateTime.now().year+5)
                       ); 
                       if (newDate!=null) {
                        // ignore: unused_local_variable
                        for(int i=0;i<=tasks!.length;i++){
                          if(tasks![i].taskName==textNameController.text){tasks![i].dueDate=newDate;}
                        }
                       }
                }, child: const Text("Due Date"),
                style:TextButton.styleFrom(primary:  Colors.blue)
                 ,)
              ],
            ),
          ),
          // ElevatedButton(onPressed: (){
          // }, child: child),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            onPressed: (){
            if(textNameController.text!=""){
            Navigator.of(context).pop(textNameController.text);}
          }, child: Text("Add Task")),
        ],),
      ),
    );
  }
}
