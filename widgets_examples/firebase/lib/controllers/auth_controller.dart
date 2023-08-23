import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day34/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final Rxn<User> user = Rxn<User>();
  final Rxn<Profile> profile = Rxn<Profile>();

  fetchProfile(String uId) async {
    var res =
        await FirebaseFirestore.instance.collection('profile').doc(uId).get();
    var data = res.data()!;
    profile(Profile(
        mbti: data['mbti'], job: data['job'], bloodtype: data['bloodtype']));
  }

  @override
  onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((value) {
      user(value);
      if (value != null) {
        // 유저가 있는 상태
        fetchProfile(value.uid);
        Get.toNamed('/home');
      } else {
        // 유저가 없는 상태
        Get.toNamed('/');
      }
    });
  }

  login(id, pw) =>
      FirebaseAuth.instance.signInWithEmailAndPassword(email: id, password: pw);

  signup(id, pw) => FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: id, password: pw);

  providerGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
