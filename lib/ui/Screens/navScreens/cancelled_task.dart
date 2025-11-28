import 'package:flutter/material.dart';
import 'package:task_management/model/task_model.dart';
import 'package:task_management/ui/Screens/navScreens/TaskCard.dart';

class CancelledTaskListScreen extends StatefulWidget {
  const CancelledTaskListScreen({super.key});

  @override
  State<CancelledTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<CancelledTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     // floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),
      
      body: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
        
           ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
         // return Taskcard(taskModel: TaskModel.fromjson(jsonData));
        },
           )

          ],
        ),
      ),
    );
  }

}
