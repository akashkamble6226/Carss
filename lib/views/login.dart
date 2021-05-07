import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
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

                   Text('Login Here',
                        style: Theme.of(context).textTheme.headline2),
                    SizedBox(
                      height: 50,
                    ),
                    buildTextField('Enter Your Email', context),
                    SizedBox(
                      height: 20,
                    ),
                    buildTextField('Mobile Number', context),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Forgot Password ?',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildButton('Login', context),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Don\'t have an account ? Click to Register.',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),

              ],),
             
                   
                
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField(String inputType, dynamic context) {
    return TextField(
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

  Widget buildButton(String buttonName, dynamic context) {
    return Container(
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
    );
  }
}
