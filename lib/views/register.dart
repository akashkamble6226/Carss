import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controllers/firebase_controller.dart';

import '../views/login.dart';
import '../Widgets/curvepainter.dart';

import 'package:colorful_safe_area/colorful_safe_area.dart';

class Register extends GetWidget<FirebaseController> {
  final TextEditingController emailtextEditingController =
      TextEditingController();
  final TextEditingController passwordtextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor('#FFD1D1'),
      body:ColorfulSafeArea(
        color:Theme.of(context).primaryColor ,
          // overflowRules: OverflowRules.all(true),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: CurvePainter(),
                      child: Container(
                        color: Theme.of(context).accentColor,
                        width: size.width,
                        height: size.height * 0.4,
                      ),

                      // size: Size(200, 100),
                    ),

                      Positioned(
                      top: 50,
                      right: 45,
                      child: Image.asset('assets/images/caronly.png'),
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(height: 10,),
                    Positioned(
                      top: size.height / 5,
                      right: 10,
                      child: Text(
                        'Register Here',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  
                  ],
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                   buildTextField(
                    'Enter Your Email', context, emailtextEditingController),
                SizedBox(
                  height: 10,
                ),
                buildTextField('Enter Mobile Number', context,
                    passwordtextEditingController),
                SizedBox(
                  height: 40,
                ),
                buildButton(context, emailtextEditingController,
                    passwordtextEditingController),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => LoginPage());
                  },
                  child: Text(
                    'Already have an account ? Click to Login.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                ],),)
               
              ],
            ),
          ),
        ),
      
    );
  }

  Widget buildTextField(
      String inputType, dynamic context, TextEditingController controllerName) {
    return Container(
      height: 60,
      child: TextField(
        // obscureText: inputType == "Enter Mobile Number" ? true :false,
        keyboardType: inputType == "Enter Mobile Number"
            ? TextInputType.number
            : TextInputType.text,
        autocorrect: true,

        cursorColor: Theme.of(context).primaryColor,
        controller: controllerName,
        // : Theme.of(context).textTheme.headline5
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 16.0,
        ),

        decoration: new InputDecoration(
          labelStyle: Theme.of(context).textTheme.headline5,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(60)),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(60)),
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
          ),
          hintText: inputType,
          hintStyle: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  //
//
  Widget buildButton(dynamic context, TextEditingController emailcontrollerName,
      TextEditingController passwordcontrollerName) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width / 2,
      child: TextButton(
        child: Text(
          'Register',
          style: Theme.of(context).textTheme.headline5,
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).accentColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ))),
        onPressed: () {
          controller.createUser(
              emailcontrollerName.text, passwordcontrollerName.text);
        },
      ),
    );
  }
}
