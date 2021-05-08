import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../controllers/firebase_controller.dart';

class FirebaseAuthBinding extends Bindings
{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FirebaseController>(() => FirebaseController());
  }
  
}