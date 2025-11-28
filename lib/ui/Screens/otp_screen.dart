import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_management/ui/Screens/reset_password.dart';
import 'package:task_management/ui/Screens/sign_up_screen.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

//import '../utils/img_path.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  static const String name = '/forgot-password/verify-otp';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                'OTP Verification',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              Text(
                'A 6 digit verification pin has been sent to your email Address',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              PinCodeTextField(
                keyboardType:  TextInputType.number,
                  appContext: context,
                  length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,

                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,



              ),

              FilledButton(
                onPressed: _onTapResetPassword,
                child: Text('Submit'),
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
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignUpButton,
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

  void _onTapResetPassword() {
    Navigator.pushNamedAndRemoveUntil(context, ResetPassword.name, (predicate)=> false);
  }

 // void _onTapForgotButton() {}

  void _onTapSignUpButton() {
    Navigator.pushNamedAndRemoveUntil(context, SignUpScreen.name,(predicate)=> false);
  }
}
