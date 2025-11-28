import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management/ui/Screens/otp_screen.dart';
import 'package:task_management/ui/Screens/sign_up_screen.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

import '../utils/img_path.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});
  static const String name = '/reset_password';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,

            children: [
              const SizedBox(height: 60),
              Text(
                  'Create New Password',
                  style: Theme.of(context).textTheme.titleLarge
              ),

              Text('Password should be at least more than 8 characters',
                style: Theme.of(context).textTheme.bodySmall,),
              TextFormField(decoration: InputDecoration(hintText: 'New Password')),
              TextFormField(decoration: InputDecoration(hintText: 'Confirm Password')),


              FilledButton(
                onPressed: (){},
                child: Icon(Icons.arrow_circle_right_rounded),
              ),
              SizedBox(height: 24),
              Center(
                child: Column(
                  children: [

                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        text: 'Dont have an account?',
                        children: [
                          TextSpan(
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                            text: 'Sign up',
                            recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _onTapOtpButton() {
  //   Navigator.pushNamed(context, OtpScreen.name);
  // }

  //void _onTapForgotButton() {}

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }
}
