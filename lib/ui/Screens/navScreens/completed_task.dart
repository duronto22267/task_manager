import 'package:flutter/material.dart';
import 'package:task_management/ui/Screens/navScreens/TaskCard.dart';

class CompleteTaskListScreen extends StatefulWidget {
  const CompleteTaskListScreen({super.key});

  @override
  State<CompleteTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<CompleteTaskListScreen> {
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
