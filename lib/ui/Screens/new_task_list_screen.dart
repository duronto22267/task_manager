import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_management/data/services/network_caller.dart';
import 'package:task_management/data/utils/urls.dart';
import 'package:task_management/model/task_count_model.dart';
import 'package:task_management/model/task_model.dart';
import 'package:task_management/ui/Screens/add_new_task_Screen.dart';
import 'package:task_management/ui/Screens/navScreens/TaskCard.dart';
import 'package:task_management/ui/widgets/show_snackbar.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  bool _getNewTaskListInProgress = false;
  bool _getTaskCountInProgress = false;
  List<TaskModel> _newTaskList = [];
  List<TaskCountModel> _taskCountList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNewTaskList();
    _getTaskCountList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTask,
        child: Icon(Icons.add),
      ),

      body: SingleChildScrollView(
        //primary: true,
        child: Column(
          spacing: 16,
          children: [
            _buildTAskSummaryListView(),
            Visibility(
              visible: _getNewTaskListInProgress == false,
              replacement: Center(child: CircularProgressIndicator()),
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: _newTaskList.length,
                itemBuilder: (context, index)  {
                  return Taskcard(taskModel: _newTaskList[index]);
                },
               
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addNewTask() {
    Navigator.pushNamed(context, AddNewTaskScreen.name);
  }

  Widget _buildTAskSummaryListView() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _taskCountList.length,

        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(left: 8),
            color: Colors.white,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Text(_taskCountList[index].sum.toString() , style: TextTheme.of(context).titleMedium),
                  Text(_taskCountList[index].id, style: TextTheme.of(context).labelSmall),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  Future<void> _getNewTaskList() async {
    _getNewTaskListInProgress = true;
    setState(() {});

    final NetWorkResponse response = await NetworkCaller.getRequest(
      Urls.newTaskList,
    );

    if (response.isSuccess) {
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.body['data']) {
        list.add(TaskModel.fromjson(jsonData));
        _newTaskList = list;
      }
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }

    _getNewTaskListInProgress = false;
    setState(() {});
  }



  Future<void> _getTaskCountList() async {
    _getTaskCountInProgress = true;
    setState(() {});

    final NetWorkResponse response = await NetworkCaller.getRequest(
      Urls.taskCountList,
    );

    if (response.isSuccess) {
      List<TaskCountModel> list = [];
      for (Map<String, dynamic> jsonData in response.body['data']) {
        list.add(TaskCountModel.fromjson(jsonData));
        _taskCountList = list;
      }
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }

    _getTaskCountInProgress = false;
    setState(() {});
  }
}
