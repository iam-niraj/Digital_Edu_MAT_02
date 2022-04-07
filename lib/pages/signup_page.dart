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
                  CupertinoFormSection(
                      header: "Personal Details"
                          .text
                          .color(Colors.deepPurple)
                          .xl
                          .bold
                          .make(),
                      children: [
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            placeholder: "Enter first name",
                          ),
                          prefix: "Name".text.make(),
                        ),
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            placeholder: "Enter surname",
                          ),
                          prefix: "Surname".text.make(),
                        ),
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            obscureText: true,
                            placeholder: "Enter Phone Number",
                          ),
                          prefix: "Phone No.".text.make(),
                        ),
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            obscureText: true,
                            placeholder: "Enter Email ID",
                          ),
                          prefix: "Email ID".text.make(),
                        ),
                      ]),
                  20.heightBox,
                  CupertinoFormSection(
                      header: "Academic Details"
                          .text
                          .color(Colors.deepPurple)
                          .xl
                          .bold
                          .make(),
                      children: [
                        CupertinoFormRow(
                          child: CupertinoTextFormFieldRow(
                            placeholder: "Enter Roll Number",
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
                                  // dropdownBD: BoxDecoration(
                                  //   border: Border.all(
                                  //       color: Colors.deepPurple, width: 3),
                                  //   borderRadius:
                                  //       BorderRadius.all(Radius.circular(10.0)),
                                  // ),
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
