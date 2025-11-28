import 'dart:io';

//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_management/ui/Screens/main_bottom_nav_holder.dart';
import 'package:task_management/ui/Screens/sign_in_screen.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

//import '../utils/img_path.dart';

class UpdateProfileScreens extends StatefulWidget {
  const UpdateProfileScreens({super.key});
  static const String name = '/update-profile-by-appBar-title#22267';

 

  @override
  State<UpdateProfileScreens> createState() => _UpdateProfileScreensState();
}

class _UpdateProfileScreensState extends State<UpdateProfileScreens> {

  File? _selecteImages;
  String? _fileName;

  Future<void> _pickImage()async{
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

    if(image!= null){
      setState(() {
        _selecteImages = File(image.path);
        _fileName = image.name;
      });

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMappBar(
        updateProfile: true,
      ),
      body: ScreenBackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,

              children: [
                const SizedBox(height: 60),
                Text(
                  'Update your Profile',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 8),
                Row(children: [

                  ElevatedButton(onPressed: _pickImage, child: Text('Choose Photo')),
                  const SizedBox(width: 20,),

                  _fileName != null
                  ? Text(_fileName!,
                    style: const TextStyle(fontSize: 16),)

                    : Text('No file choosen',style: TextStyle(color: Colors.grey),)

                ],),
                TextFormField(decoration: InputDecoration(hintText: 'Email')),


                TextFormField(
                  decoration: InputDecoration(hintText: 'First Name'),
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Last Name'),
                ),
                TextFormField(decoration: InputDecoration(hintText: 'Mobile')),

                //TextFormField(decoration: InputDecoration(hintText: 'Password')),
                FilledButton(
                  onPressed: _onTapConfirmUpdateButton,
                  child: Text('Confirm Update'),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapConfirmUpdateButton() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      MainBottomNavHolder.name,
      (predicate) => false,
    );
  }
}
