import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/ui/Screens/main_bottom_nav_holder.dart';
import 'package:task_management/ui/Screens/sign_in_screen.dart';
import 'package:task_management/ui/controller/auth_controllers.dart';
import 'package:task_management/ui/utils/img_path.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    bool isLoggedIn = await AuthControllers.isUserLoggedIn();
    if(isLoggedIn){
      await AuthControllers.getUserData();
      Navigator.pushReplacementNamed(context, MainBottomNavHolder.name);
    }
    else{Navigator.pushReplacementNamed(context, SignInScreen.name);
  }}
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackgroundWidget(
        child: Center(child: SvgPicture.asset(ImgPath.logoImg)),
      ),
    );
  }
}
