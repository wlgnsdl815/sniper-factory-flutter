import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  checkEmailVerification() {
    var email = FirebaseAuth.instance.currentUser!.email;
    print(email);
    return email;
  }
}
