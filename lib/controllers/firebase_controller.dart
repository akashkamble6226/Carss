import 'package:carss/views/login.dart';


import '../views/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> firebaseUser = Rxn<User>();

  RxBool loggedIn = false.obs;
  RxBool isLoading = false.obs;

  String get user => firebaseUser.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit

    firebaseUser.bindStream(_auth.authStateChanges());

    isUserLoggedIn();
    super.onInit();
  }

  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Get.to(() => HomePage());
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

    
      // Get.rawSnackbar(title:"Loading",message: 'Loading your accont');
     
    try {
     
      await _auth.signInWithEmailAndPassword(email: email, password: password).whenComplete(() {isLoading = true.obs;}) ;

      

      Get.to(() => HomePage());




     

    } catch (e) {
      Get.snackbar(
        'Error signing in the account',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    
  }

  void logout() async {
    try {
      turnOnLoader(false);
      await _auth.signOut();

      Get.offAll(() => LoginPage());

    } catch (e) {

      Get.snackbar(
        'Error',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    
  }

  void isUserLoggedIn() {
    if (_auth.currentUser?.uid != null) {
//  logged in
      loggedIn = true.obs;
     
    } else {
// not logged
      loggedIn = false.obs;
    
    }
  }

  void turnOnLoader(bool isLoggingIn)
  {
    
    if(isLoggingIn)
    {
      isLoading = true.obs;
    }
    else
    {
      isLoading = false.obs;
    }
    update();
  }
}
