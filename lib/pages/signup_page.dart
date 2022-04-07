// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_2/utils/routes.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();
  List<dynamic> dropdownItemList = [
    {'label': 'V', 'value': '5'},
    {'label': 'VI', 'value': '6'},
    {'label': 'VII', 'value': '7'},
    {'label': 'VIII', 'value': '8'},
    {'label': 'IX', 'value': '9'},
    {'label': 'X', 'value': '10'},
  ];
  List<dynamic> dropdownItemList1 = [
    {'label': 'A', 'value': 'a'},
    {'label': 'B', 'value': 'b'},
    {'label': 'C', 'value': 'c'},
    {'label': 'D', 'value': 'd'},
    {'label': 'E', 'value': 'e'},
    {'label': 'F', 'value': 'f'},
  ];

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

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
                  "Sign up".text.xl5.bold.color(Colors.deepPurple).make(),
                  "Create an account".text.xl2.make(),
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
                            placeholder: "Enter first name",
                            validator: validateName,
                          ),
                          prefix: "Name".text.make(),
                        ),
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            textInputAction: TextInputAction.next,
                            placeholder: "Enter surname",
                            validator: validateSurname,
                          ),
                          prefix: "Surname".text.make(),
                        ),
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            textInputAction: TextInputAction.next,
                            placeholder: "Enter email ID",
                            validator: validateEmail,
                          ),
                          prefix: "Email ID".text.make(),
                        ),
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            textInputAction: TextInputAction.next,
                            placeholder: "Enter phone number",
                            validator: validatePhone,
                          ),
                          prefix: "Phone No.".text.make(),
                        ),
                      ]),
                  20.heightBox,
                  CupertinoFormSection.insetGrouped(
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
                                  defaultValue: dropdownItemList[0],
                                  dropdownHeight: 250,
                                  resultWidth: 80,
                                  resultHeight: 40,
                                  dropdownList: dropdownItemList,
                                  onChange: (selectedItem) {
                                    print(selectedItem);
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
                                  defaultValue: dropdownItemList1[0],
                                  dropdownHeight: 250,
                                  resultWidth: 80,
                                  resultHeight: 40,
                                  dropdownList: dropdownItemList1,
                                  onChange: (selectedItem) {
                                    print(selectedItem);
                                  },
                                  onOpen: (isOpen) {
                                    print(isOpen);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                  30.heightBox,
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(Icons.done, color: Colors.white)
                            : Text(
                                "Sign up",
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
}

String? validateName(String? value) {
  String? patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value!.length == 0) {
    return "Username cannot be empty";
  } else if (!regExp.hasMatch(value)) {
    return "Username must be a-z and A-Z";
  }
  return null;
}

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
