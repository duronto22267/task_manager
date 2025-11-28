import 'package:flutter/material.dart';
import 'package:task_management/ui/Screens/add_new_task_Screen.dart';
import 'package:task_management/ui/Screens/forgot_password.dart';
import 'package:task_management/ui/Screens/main_bottom_nav_holder.dart';
import 'package:task_management/ui/Screens/navScreens/update_profile_screens.dart';
import 'package:task_management/ui/Screens/otp_screen.dart';
import 'package:task_management/ui/Screens/reset_password.dart';
import 'package:task_management/ui/Screens/sign_in_screen.dart';
import 'package:task_management/ui/Screens/sign_up_screen.dart';
import 'package:task_management/ui/Screens/splash_screen.dart';

class TaskManagementApp extends StatelessWidget {
  const TaskManagementApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      navigatorKey: navigatorKey,
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.green.shade50,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              fixedSize: Size.fromWidth(double.maxFinite),
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400
            ),
            border: OutlineInputBorder(
               borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8)
            ),
            enabledBorder: OutlineInputBorder(
               borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8)
            ),
            disabledBorder: OutlineInputBorder(
               borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8)
            ),
            errorBorder: OutlineInputBorder(
               borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8)
            ),
            focusedBorder: OutlineInputBorder(
               borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8)
            )
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w600,
          ),
          bodySmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey
          )
        )
      ),

      routes: <String,WidgetBuilder>{
        SplashScreen.name  : (_) => SplashScreen(),
        SignInScreen.name : (_)=> SignInScreen(),
        SignUpScreen.name:(_)=> SignUpScreen(),
        ForgotPasswordEmail.name: (_)=> ForgotPasswordEmail(),
        OtpScreen.name:(_)=> OtpScreen(),
        ResetPassword.name: (_)=> ResetPassword(),
        MainBottomNavHolder.name: (_)=> MainBottomNavHolder(),
        AddNewTaskScreen.name:(_)=> AddNewTaskScreen(),
        UpdateProfileScreens.name:(_)=> UpdateProfileScreens()
      },
      initialRoute: SplashScreen.name,
    );
  }
}
