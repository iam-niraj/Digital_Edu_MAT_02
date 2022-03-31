import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:task_2/screens/login_page.dart';

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
      nextScreen: LoginPage(),
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(seconds: 2),
      backgroundColor: Colors.deepPurpleAccent,
      splashIconSize: 140.0,
    ));
  }
}
