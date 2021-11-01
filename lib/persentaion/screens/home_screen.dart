import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoly/data/task.dart';
import 'package:todoly/persentaion/screens/add_task_screen.dart';
import 'package:todoly/persentaion/screens/done_screen.dart';
import 'package:todoly/persentaion/screens/to_do_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin {
  int _selectedIndex=0;
  List<Task> tasks = [
    Task(taskName: "eat breakfast"),
    Task(taskName: "drink cofee"),
    Task(taskName: "morining training"),
    Task(taskName: "Go to Work"),
  ];
late TabController _tabController;
@override
  // ignore: must_call_super
  void initState() {
    _tabController=TabController(length: 3, vsync:this);
  }
@override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
  }
  // ignore: avoid_types_as_parameter_names
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        // bottomSheet: BottomSheet(builder: buildco,)
        
        floatingActionButton:FloatingActionButton(onPressed:()async{
             var text= await Navigator.of(context).pushNamed("/add_task") as String;
              //var date=  Navigator.of(context).pushNamed("/add_task") as DateTime;
             setState(() {
             tasks.add(Task(taskName: text));
              });
          return(
          showModalBottomSheet(
            enableDrag: false,
            context:context,
            builder: (context)=>buildSheet()));},
      
         child: Icon(Icons.add),),
        appBar: AppBar(
          title: const Text("Organize your tasks"),
        // bottom: const TabBar(
        //   tabs: [
        //     Tab(text: "All Tasks",),
        //     Tab(text: "TO DO",),
        //     Tab(text: "Done",),
        //   ],
        //   ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
       
        body: TabBarView(
          controller: _tabController,
          children: [
          ListView.builder(itemBuilder: (context,index){
            return ListTile(
              title: Text(tasks[index].taskName
              ,style: Theme.of(context).textTheme.bodyText1!.copyWith(
                decoration: tasks[index].isDone?TextDecoration.lineThrough:null,
              )),
              trailing: Checkbox(onChanged: (val){
                setState(() {
                  tasks[index].isDone=val!;
                  if(tasks[index].isDone){
                    tasks[index].doneTime=DateTime.now();
                  }
                });
              },
              value: tasks[index].isDone,
              ),
                        );
          }, itemCount: tasks.length,
          ),
           ToDoScreen(tasks:tasks ),
          DoneScreen(tasks: tasks),
        ],),
        // ignore: prefer_const_literals_to_create_immutables
        bottomNavigationBar: BottomNavigationBar(items: [
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.thList),
            label: "All Tasks",
            backgroundColor: Colors.red,
            ),
            const BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bell),
              label:"To Do",
              backgroundColor:Colors.yellow,
  
              
              ),
              const BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.check),
                label: "Done",
                backgroundColor: Colors.green,
              ),
              
        ],
        onTap: (currentIndex){
          setState(() {
          _selectedIndex=currentIndex;
          });
          _tabController.animateTo(_selectedIndex);
          
        },
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.blueAccent[600],
       
        ),
    
      );
  }
  Widget buildSheet()=>Container(
    
  );
}
