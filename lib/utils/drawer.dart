import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_2/utils/Themes/dark_theme_provider.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Albus"),
            accountEmail: Text("contact.albus@gmail.com"),
            currentAccountPicture: CircleAvatar(
                // backgroundImage: AssetImage(),
                ),
            decoration: BoxDecoration(color: Colors.deepPurple),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: Text("Account"),
            subtitle: Text("Personal"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("contact.albus@gmail.com"),
            trailing: Icon(Icons.send),
          ),
          ListTile(
            title: Text("Dark Mode"),
            leading: DayNightSwitcherIcon(
                  isDarkModeEnabled: themeChange.darkTheme,
                  onStateChanged: (bool value) {
                  themeChange.darkTheme = value;
                }
                ),
            trailing: Switch(
                value: themeChange.darkTheme,
                onChanged: (bool value) {
                  themeChange.darkTheme = value;
                }),    
             
             /* Switch(
                value: themeChange.darkTheme,
                onChanged: (bool value) {
                  themeChange.darkTheme = value;
                }), */

          ),
        ],
      ),
    );
  }
}
