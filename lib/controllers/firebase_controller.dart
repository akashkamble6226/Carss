import '../views/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> firebaseUser = Rxn<User>();

 

  String get user => firebaseUser.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit

    firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Get.to(() =>HomePage());
    } catch (e) {
      Get.snackbar(
        'Error creating the account',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    ;
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Get.to(() =>HomePage());
    } catch (e) {
      Get.snackbar(
        'Error signing in the account',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    ;
  }

  void logout() async {
    try {
      await _auth.signOut();
    } catch (e) {

      
    }
    ;
  }
}
