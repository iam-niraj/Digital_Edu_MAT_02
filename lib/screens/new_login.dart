import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewLogin extends StatelessWidget {
  var padding;

  get value => null;

  get changeButton => null;

  get foreground => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric (
             vertical: 16.0, horizontal: 32.0),
          
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sign in",
              textAlign: TextAlign.center,
              style: 
                 TextStyle(fontSize: 28,color : Colors.black,fontWeight: FontWeight.bold)),  
                 CupertinoFormSection(
                   header: Text("Personal Details",
                    style: 
                 TextStyle(fontSize: 16,color : Colors.black,fontWeight: FontWeight.bold)),
                    children:[
                      CupertinoFormRow(
                       child: CupertinoTextFormFieldRow(
                         placeholder: "Enter Your Name",
                       ),
                       prefix: Text("Name"),
                       ),

                      CupertinoFormRow(
                       child: CupertinoTextFormFieldRow(
                         placeholder: "Enter Your Surname",
                       ),
                       prefix: Text("Surname"),
                       ),

                       CupertinoFormRow(
                       child: CupertinoTextFormFieldRow(
                        obscureText: true,
                        placeholder: "Enter Phone Number",
                       ),
                       prefix: Text("Phone No."),
                       ),

                       CupertinoFormRow(
                       child: CupertinoTextFormFieldRow(
                        obscureText: true,
                         placeholder: "Enter Email ID",
                       ),
                       prefix: Text("Email ID"),
                       ),

                ]),


                 CupertinoFormSection(
                   header: Text("Academic Details",
                   textAlign: TextAlign.center,
                   style: 
                 TextStyle(fontSize: 16,color : Colors.black,fontWeight: FontWeight.bold,)
                       ),
                   
                    children:[
                      CupertinoFormRow(
                       child: CupertinoTextFormFieldRow(
                         placeholder: "Enter Roll Number",
                       ),
                       prefix: Text("Roll No."),
                       ),

                      CupertinoFormRow(
                       child: CupertinoTextFormFieldRow(
                         placeholder: "Enter Standard",
                       ),
                       prefix: Text("Standard"),
                       ),

                       CupertinoFormRow(
                       child: CupertinoTextFormFieldRow(
                         placeholder: "Enter Division",
                       ),
                       prefix: Text("Division"),
                       ),

                   ]),

                CupertinoFormSection(
                   header: Text("Terms & Conditions"),
                    children:[
                      CupertinoFormRow(
                       child: CupertinoSwitch(
                         value: true,
                         onChanged: (value),
                       ),
                       prefix: Text("I Agree"),
                       ),
                   ]),

         

                 ], 

          ), 
          ),
        ),
      
    );
  }

  moveToHome(BuildContext context) {}
}
