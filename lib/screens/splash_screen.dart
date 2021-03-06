import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:task_2/screens/Homepage.dart';
import 'package:task_2/screens/login_page.dart';
import 'package:task_2/screens/sign_up_page.dart';
import 'package:task_2/utils/SharedPrefs/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
        duration: 2000,
        splash: CircleAvatar(
        radius: 80.0,
        backgroundImage: AssetImage('assets/images/splash.png'),
      ),
      nextScreen: SignUpPage(),/* SharedPreference.loginprefs!.getBool("loggedIn")==true ? HomePage() : LoginPage(), */
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(seconds: 2),
      backgroundColor: Colors.deepPurpleAccent,
      splashIconSize: 140.0,
    ));
  }
}
