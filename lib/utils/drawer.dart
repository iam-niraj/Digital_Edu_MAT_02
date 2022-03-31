import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            decoration: BoxDecoration(color: Colors.blueAccent),
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
        ],
      ),
    );
  }
}