import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_2/routes/routes.dart';
import 'package:task_2/utils/Database/dao/StudentDAO.dart';
import 'package:task_2/utils/Database/database.dart';
import 'package:task_2/utils/Database/entity/Student.dart';
import 'package:velocity_x/velocity_x.dart';

class Update extends StatefulWidget {
  Update({Key? key, required this.updateStudent}) : super(key: key);

  final updateStudent;

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();

  List<dynamic> dropdownStandarList = [
    {'label': 'V', 'value': 5},
    {'label': 'VI', 'value': 6},
    {'label': 'VII', 'value': 7},
    {'label': 'VIII', 'value': 8},
    {'label': 'IX', 'value': 9},
    {'label': 'X', 'value': 10},
  ];

  List<dynamic> dropdownDivisionList = [
    {'label': 'A', 'value': 'A'},
    {'label': 'B', 'value': 'B'},
    {'label': 'C', 'value': 'C'},
    {'label': 'D', 'value': 'D'},
    {'label': 'E', 'value': 'E'},
    {'label': 'F', 'value': 'F'},
  ];

  int? selectedStandard = 0;

  String? selectedDivision = "";

  final rollNoController = TextEditingController();

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();

  final contactController = TextEditingController();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      //  await Future.delayed(Duration(seconds: 1));
      final database = await $FloorAppDatabase
          .databaseBuilder('student_database.db')
          .build();
      final dao = database.studentDAO;

      widget.updateStudent.firstName = firstNameController.text == ""
          ? widget.updateStudent.firstName
          : firstNameController.text;
      widget.updateStudent.lastName = lastNameController.text == ""
          ? widget.updateStudent.lastName
          : lastNameController.text;
      widget.updateStudent.email = emailController.text == ""
          ? widget.updateStudent.email
          : emailController.text;

      /* widget.updateStudent.firstName = Faker().person.firstName();
      widget.updateStudent.lastName = Faker().person.lastName();
      widget.updateStudent.email = Faker().internet.email(); */

      showSnackBar(scaffoldKey.currentState, 'Update Success');

      await dao.updateStudent(widget.updateStudent);
      await Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: SafeArea(
            child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Update".text.xl5.bold.color(Colors.deepPurple).make(),
                  "Update your Details".text.xl2.make(),
                  20.heightBox,
                  CupertinoFormSection.insetGrouped(
                      margin: EdgeInsets.all(0),
                      header: "Personal Details"
                          .text
                          .color(Colors.deepPurple)
                          .xl
                          .bold
                          .make(),
                      children: [
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            textInputAction: TextInputAction.next,
                            placeholder: "Edit name",
                            controller: firstNameController,
                          ),
                          prefix: "Name".text.make(),
                        ),
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            textInputAction: TextInputAction.next,
                            placeholder: "Edit surname",
                            controller: lastNameController,
                          ),
                          prefix: "Surname".text.make(),
                        ),
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            textInputAction: TextInputAction.next,
                            placeholder: "Edit Email ID",
                            controller: emailController,
                          ),
                          prefix: "Email ID".text.make(),
                        ),
                        /* CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            textInputAction: TextInputAction.next,
                            placeholder: "Enter phone number",
                            controller: contactController,
                            validator: validatePhone,
                          ),
                          prefix: "Phone No.".text.make(),
                        ), */
                      ]),
                  20.heightBox,
                  /* CupertinoFormSection.insetGrouped(
                      margin: EdgeInsets.all(0),
                      header: "Academic Details"
                          .text
                          .color(Colors.deepPurple)
                          .xl
                          .bold
                          .make(),
                      children: [
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            textInputAction: TextInputAction.next,
                            placeholder: "Enter roll number",
                            controller: rollNoController,
                            validator: validateRollno,
                          ),
                          prefix: "Roll No.".text.make(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Std",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CoolDropdown(
                                  selectedItemTS:
                                      TextStyle(color: Colors.deepPurple),
                                  selectedItemBD: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.deepPurple, width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  resultBD: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.deepPurple),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  defaultValue: dropdownStandarList[0],
                                  dropdownHeight: 250,
                                  resultWidth: 82,
                                  resultHeight: 40,
                                  dropdownList: dropdownStandarList,
                                  onChange: (standard) {
                                    selectedStandard = standard['value'];
                                    print(selectedStandard);
                                  },
                                  onOpen: (isOpen) {
                                    print(isOpen);
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Division:",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CoolDropdown(
                                  selectedItemTS:
                                      TextStyle(color: Colors.purpleAccent),
                                  selectedItemBD: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.deepPurple, width: 3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  resultBD: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.deepPurple),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  defaultValue: dropdownDivisionList[0],
                                  dropdownHeight: 250,
                                  resultWidth: 70,
                                  resultHeight: 40,
                                  dropdownList: dropdownDivisionList,
                                  onChange: (division) {
                                    selectedDivision = division['value'];
                                    print(selectedDivision);
                                  },
                                  onOpen: (isOpen) {
                                    print(isOpen);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]), */
                  30.heightBox,
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () {
                        moveToHome(context);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(Icons.done, color: Colors.white)
                            : Text(
                                "Update",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                      ),
                    ),
                  ).centered(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(ScaffoldState? currentState, String s) {
    final snackbar = SnackBar(
      content: Text(s),
    );
    currentState?.showSnackBar(snackbar);
  }
}

/* String? validateName(String? value) {
  String? patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value!.length == 0) {
    return "Username cannot be empty";
  } else if (!regExp.hasMatch(value)) {
    return "Username must be a-z and A-Z";
  }
  return null;
} */

String? validateSurname(String? value) {
  String? patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value!.length == 0) {
    return "User surname cannot be empty";
  } else if (!regExp.hasMatch(value)) {
    return "User surname must be a-z and A-Z";
  }
  return null;
}

String? validatePhone(String? value) {
  String? patttern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value!.length == 0) {
    return "Phone no. cannot be empty";
  } else if (value.length != 10) {
    return "Phone no. must be of 10 digits";
  } else if (!regExp.hasMatch(value)) {
    return "Phone no. must be of digits";
  }
  return null;
}

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value!.length == 0) {
    return "Email ID cannot be empty";
  } else if (!regExp.hasMatch(value)) {
    return "Email ID is not valid";
  } else {
    return null;
  }
}

String? validateRollno(String? value) {
  String? patttern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value!.length == 0) {
    return "Roll no. cannot be empty";
  } else if (value.length != 2) {
    return "Roll no. must be of 2 digits";
  } else if (!regExp.hasMatch(value)) {
    return "Roll no. must be of digits";
  }
  return null;
}
