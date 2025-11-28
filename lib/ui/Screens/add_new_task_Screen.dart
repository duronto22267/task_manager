import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_management/data/services/network_caller.dart';
import 'package:task_management/data/utils/urls.dart';
import 'package:task_management/ui/Screens/main_bottom_nav_holder.dart';
import 'package:task_management/ui/widgets/screen_background.dart';
import 'package:task_management/ui/widgets/show_snackbar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});
  static const String name = 'add-new-task';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController titleTEcontroller = TextEditingController();
  final TextEditingController descriptionTEcontroller = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool addNewTaskInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMappBar(),
      body: ScreenBackgroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35),
                  Text('Add New Task', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 8),

                  TextFormField(
                    controller: titleTEcontroller,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'enter title';
                      } else {}
                    },

                    decoration: InputDecoration(hint: Text('Title')),
                  ),

                  SizedBox(height: 8),

                  TextFormField(
                    controller: descriptionTEcontroller,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'enter your description';
                      }
                    },
                    maxLines: 8,
                    decoration: InputDecoration(hint: Text('Description')),
                  ),
                  SizedBox(height: 10),

                  Visibility(
                    visible: addNewTaskInProgress == false,
                    replacement: Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: FilledButton(
                      onPressed: _onTapSubmitButton,
                      child: Icon(Icons.arrow_circle_right_rounded),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() {
    if (_formKey.currentState!.validate()) {
      //To Do

      _addNewTask();
    }
  }

  Future<void> _addNewTask() async {
    addNewTaskInProgress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      "title": titleTEcontroller.text.trim(),
      "description": descriptionTEcontroller.text.trim(),
      "status": "New",
    };

    final NetWorkResponse response = await NetworkCaller.postRequest(
      Urls.createNewTask,
      body: requestBody,
    );

    addNewTaskInProgress = false;
    setState(() {
      
    });

    if(response.isSuccess){

      _clearTextFields();
      showSnackBarMessage(context, 'added new task');

    }
    else{

      showSnackBarMessage(context, response.errorMessage);

    }
  }

  void _clearTextFields(){
    titleTEcontroller.clear();
    descriptionTEcontroller.clear();
  }


}
