// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task_2/utils/routes.dart';
import 'package:task_2/utils/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _divison = ['A' , 'B' , 'C' , 'D'];
  String name = "";
  bool changeButton = false;

  final _formkey = GlobalKey<FormState>();


  set dropdownvalue(String dropdownvalue) {}

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
        SharedPreference.loginprefs?.setBool("loggedIn", true);
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
        setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
         color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                // Image.asset("assets/images/hey_image.png", fit: BoxFit.cover),
                
                SizedBox(height: 30.0),
                Text("Welcome $name !!",
                    style:
                        TextStyle(fontSize: 28,color : Colors.black,fontWeight: FontWeight.bold)),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/login.png",),fit: BoxFit.fill)
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter Name", labelText: "Name" ,icon: const Icon(Icons.person) ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name cannot be empty.";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                      
                      
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Surname", labelText: "Surname" , icon: const Icon(Icons.people),),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Surname cannot be empty.";
                            } 
                            return null;
                          },
                        ),

                      TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter Roll Number", labelText: "Roll No." , icon: const Icon(Icons.circle)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Roll No. cannot be empty.";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),

                       TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter Your Standard", labelText: "Standard" , icon: const Icon(Icons.podcasts)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Standard cannot be empty.";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),


                      TextFormField(
                          decoration: InputDecoration(
                              hintText: "Enter Phone NO.", labelText: "Phone Number" , icon: const Icon(Icons.phone)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Phone cannot be empty.";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),

                      TextField(
                        decoration: InputDecoration(
                                 hintText: "Enter Email ID", labelText: "Email ID" , icon: const Icon(Icons.mail)),
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                      ),

                        SizedBox(height: 20.0),
                        Material(
                          color: Colors.grey,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                          child: InkWell(
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changeButton ? 50 : 150,
                              height: 50,
                              alignment: Alignment.center,
                              child: changeButton
                                  ? Icon(Icons.done, color: Colors.black)
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 20, 17, 17),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}