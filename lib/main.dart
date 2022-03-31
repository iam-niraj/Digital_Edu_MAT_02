// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_2/screens/Homepage.dart';
import 'package:task_2/screens/login_page.dart';
import 'package:task_2/screens/splash_screen.dart';
import 'package:task_2/utils/routes.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Task_2',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashScreen(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
  ));
}