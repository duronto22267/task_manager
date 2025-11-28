import 'package:flutter/material.dart';
import 'package:task_management/ui/Screens/navScreens/TaskCard.dart';

class ProgressTaskList extends StatefulWidget {
  const ProgressTaskList({super.key});

  @override
  State<ProgressTaskList> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<ProgressTaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     // floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
      
      body: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
        
           // Taskcard(),
          ],
        ),
      ),
    );
  }

}
