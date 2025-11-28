import 'package:flutter/material.dart';
import 'package:task_management/model/task_model.dart';

class Taskcard extends StatelessWidget {
  const Taskcard({
    super.key, required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Card(
          child: ListTile(
            title: Text(taskModel.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taskModel.description),
                Text(taskModel.createdDate),
                Row(children: [
                  Chip(
                    label: Text(taskModel.status,style: TextStyle(color: Colors.white),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
            
                    ),
                    backgroundColor: Colors.green,
                    ),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                    
                    
                    ]
                    ),
                    
              ],
            ),
          ),
        );
      
    
  }
}

