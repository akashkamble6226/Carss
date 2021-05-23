import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controllers/firebase_controller.dart';
import '../views/register.dart';
import 'package:carss/controllers/firebase_controller.dart';
import '../Widgets/curvepainter.dart';

class LoginPage extends GetWidget<FirebaseController> {
  final TextEditingController emailtextEditingController =
      TextEditingController();
  final TextEditingController passwordtextEditingController =
      TextEditingController();

  //final FirebaseController firebaseController = Get.put(FirebaseController());

  // void turnOnLoader()
  // {

  //   controller.isLoading = true.obs;

  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: HexColor('#FFD1D1'),
        body: ColorfulSafeArea(
          color: Theme.of(context).primaryColor,
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
                      right: 35,
                      child: Image.asset('assets/images/caronly.png'),
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Positioned(
                      top: size.height / 5,
                      right: 10,
                      child: Text(
                        'Login Here',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 50,
                // ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      buildTextField('Enter Your Email', context,
                          emailtextEditingController),
                      SizedBox(
                        height: 10,
                      ),
                      buildTextField('Enter Mobile Number', context,
                          passwordtextEditingController),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      GetBuilder<FirebaseController>(
                          init: FirebaseController(),
                          builder: (controller) {
                            return controller.isLoading.value
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : SizedBox(
                                    height: 5,
                                  );
                          }),
                      SizedBox(
                        height: 50,
                      ),
                      buildButton(context, emailtextEditingController,
                          passwordtextEditingController),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => Register());
                        },
                        child: Text(
                          'Don\'t have an account ? Click to Register.',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget buildTextField(
      String inputType, dynamic context, TextEditingController controllerName) {
    return Container(
      height: 60,
      child: TextField(
        obscureText: inputType == "Enter Mobile Number" ? true : false,
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
            borderRadius: BorderRadius.all(Radius.circular(50)),
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

  Widget buildButton(dynamic context, TextEditingController emailcontrollerName,
      TextEditingController passwordcontrollerName) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width / 2,
      child: TextButton(
        child: Text(
          'Login',
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
          if (emailcontrollerName.text.isEmpty) {
            Get.snackbar(
              'Please enter email',
              'Email can\'t be empty',
              snackPosition: SnackPosition.BOTTOM,
            );
          } else if (passwordcontrollerName.text.isEmpty) {
            Get.snackbar(
              'Please enter phone number',
              'Phone number can\'t be empty',
              snackPosition: SnackPosition.BOTTOM,
            );
          } else {
            controller.turnOnLoader(true);

            controller.login(
                emailcontrollerName.text, passwordcontrollerName.text);
          }
        },
      ),
    );
  }
}
