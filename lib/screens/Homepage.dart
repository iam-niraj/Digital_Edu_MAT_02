import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:task_2/screens/update_student.dart';
import 'package:task_2/utils/Database/entity/Student.dart';
import 'package:task_2/utils/SharedPrefs/shared_preferences.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../utils/Database/dao/StudentDAO.dart';
import '../Widgets/drawer.dart';

void main(List<String> args) {}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.dao}) : super(key: key);

  final StudentDAO? dao;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                /* SharedPreference.loginprefs!.setBool("loggedIn", false); */
                Navigator.pushReplacementNamed(context, "/signin");
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: StreamBuilder(
        stream: widget.dao!.getAllStudent(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            var listStudents = snapshot.data as List<Student>;
            return ListView.builder(
                itemCount: listStudents != null ? listStudents.length : 0,
                itemBuilder: (context, index) {
                  return Slidable(
                    child: ListTile(
                      title: Text(
                          '${listStudents[index].firstName} ${listStudents[index].lastName}'),
                      subtitle: Text('${listStudents[index].email}'),
                    ),
                    startActionPane:
                        ActionPane(motion: DrawerMotion(), children: [
                      SlidableAction(
                        onPressed: (context) async {
                          final updateStudent = listStudents[index];

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Update(updateStudent: updateStudent)));
                        },
                        label: 'Update',
                        backgroundColor: Colors.blue,
                        icon: Icons.update,
                      ),
                      SlidableAction(
                        onPressed: (context) async {
                          final deleteStudent = listStudents[index];

                          await widget.dao!.deleteStudent(deleteStudent);
                        },
                        label: 'Delete',
                        backgroundColor: Colors.blue,
                        icon: Icons.delete,
                      )
                    ]),
                  );
                });
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_rounded),
            label: 'Activity',
            tooltip: 'Activity',
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            tooltip: 'Settings',
            backgroundColor: Colors.blue),
      ]),
      drawer: MyDrawer(),
      // ignore: dead_code
    );
    ;
  }
}
