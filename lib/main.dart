<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:task_2/Screen/homepage.dart';

void main() {
  runApp(MaterialApp(
    home: Homepage(),));
=======
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_2/screens/Homepage.dart';
import 'package:task_2/screens/login_page.dart';
import 'package:task_2/screens/splash_screen.dart';
import 'package:task_2/utils/Themes/dark_theme_provider.dart';
import 'package:task_2/utils/Themes/theme.dart';
import 'package:task_2/utils/routes.dart';
import 'package:task_2/utils/shared_preferences.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreference.loginprefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) {
      return themeChangeProvider;
    },
    child: Consumer<DarkThemeProvider>(
      builder: (BuildContext context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          routes: {
         "/": (context) => SplashScreen(),
         MyRoutes.homeRoute: (context) => HomePage(),
         MyRoutes.loginRoute: (context) => LoginPage()
         },
      );
      })
    );
  }
>>>>>>> master
}
