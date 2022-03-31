import 'package:flutter/material.dart';
import 'package:task_2/screens/home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
            duration: 2000,
            splash: CircleAvatar(
              backgroundImage: AssetImage("assets/images/splash.png"),
              minRadius: 50,
              maxRadius: 75,
            ),
            nextScreen: HomePage(),
            splashTransition: SplashTransition.fadeTransition,
            animationDuration: Duration(seconds: 2),
            backgroundColor: Colors.grey.shade100
            )
            );
  }
}