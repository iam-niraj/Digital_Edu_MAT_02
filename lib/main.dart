import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_2/screens/Homepage.dart';
import 'package:task_2/screens/login_page.dart';
import 'package:task_2/screens/sign_up_page.dart';
import 'package:task_2/screens/update_student.dart';
import 'package:task_2/utils/Database/dao/StudentDAO.dart';
import 'package:task_2/utils/Database/database.dart';
import 'package:task_2/utils/Themes/dark_theme_provider.dart';
import 'package:task_2/utils/Themes/theme.dart';
import 'package:task_2/routes/routes.dart';
import 'package:task_2/utils/SharedPrefs/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* SharedPreference.loginprefs = await SharedPreferences.getInstance(); */
  final database =
      await $FloorAppDatabase.databaseBuilder('student_database.db').build();
  final dao = database.studentDAO;
  runApp(MyApp(dao : dao));
}

class MyApp extends StatefulWidget {
 late final StudentDAO? dao;

  MyApp({this.dao});

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
    }, child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Styles.themeData(themeChangeProvider.darkTheme, context),
        routes: {
          "/": (context) => HomePage(dao: widget.dao,),
          MyRoutes.homeRoute: (context) => HomePage(dao:widget.dao),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.signinRoute: (context) => SignUpPage(dao: widget.dao),
        },
      );
    }));
  }
}
