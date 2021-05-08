import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/firebase_controller.dart';

import '../views/login.dart';


class Register extends GetWidget<FirebaseController> {

  final TextEditingController emailtextEditingController =
      TextEditingController();
  final TextEditingController passwordtextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Registe Here',
                      style: Theme.of(context).textTheme.headline2),
                  SizedBox(
                    height: 50,
                  ),
                 buildTextField(
                      'Enter Your Email', context, emailtextEditingController),
                  SizedBox(
                    height: 20,
                  ),
               buildTextField(
                      'Mobile Number', context, passwordtextEditingController),
                  SizedBox(
                    height: 40,
                  ),
                 
                buildButton('Register', context, emailtextEditingController,
                      passwordtextEditingController),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                       Get.to(() =>LoginPage());
                    },
                                      child: Text(
                      'Already have an account ? Click to Login.',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );


  }

  Widget buildTextField(
      String inputType, dynamic context, TextEditingController controllerName) {
    return TextField(
      controller: controllerName,
      style: Theme.of(context).textTheme.headline5,
      decoration: new InputDecoration(
        labelStyle: Theme.of(context).textTheme.headline5,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        hintText: inputType,
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget buildButton(
      String buttonName,
      dynamic context,
      TextEditingController emailcontrollerName,
      TextEditingController passwordcontrollerName) {
    return GestureDetector(
      onTap: () {
        print(emailcontrollerName.text);
        print(passwordcontrollerName.text);

          if(buttonName == 'Login')
          {
              controller.login(emailcontrollerName.text, passwordcontrollerName.text);
          }

          if(buttonName == 'Register')
          {
            controller.createUser(emailcontrollerName.text, passwordcontrollerName.text);
          }

           if(buttonName == 'Logout')
          {
            controller.logout();
          }
        
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
        ),
        child: Center(
          child: Text(
            buttonName,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
  
  }