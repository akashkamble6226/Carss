import 'package:carss/views/login.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';

import './views/homepage.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import './bindings/firebas_auth_binding.dart';

import 'package:carss/controllers/firebase_controller.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseController firebaseController = Get.put(FirebaseController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: FirebaseAuthBinding(),
      color: HexColor('#ffffff'),
      debugShowCheckedModeBanner: false,
      title: 'Carss',
      theme: ThemeData(
        //brightness: Brightness.dark,
        // background
        primaryColor: HexColor('#FF7777'),
        //secondary color
        accentColor: HexColor('#FF6161'),
        fontFamily: 'Spartan-Regular',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: HexColor('#FF7777'),
        ),

        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 16, color: Colors.white)),
          titleTextStyle: TextStyle(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: HexColor('#FF6161'),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline2: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline3: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline4: TextStyle(fontSize: 14.0, color: Colors.white),
          headline5: TextStyle(fontSize: 16.0, color: Colors.white),
          bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
          headline6: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: firebaseController.loggedIn.value ? HomePage() : LoginPage(),
    );
  }
}
