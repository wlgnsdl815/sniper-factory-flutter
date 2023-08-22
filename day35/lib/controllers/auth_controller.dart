import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day35/models/profile_model.dart';
import 'package:day35/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  Rxn<User> user = Rxn<User>();
  Rxn<Profile> profile = Rxn<Profile>();

  fetchProfile(String uid) async {
    var res =
        await FirebaseFirestore.instance.collection('profile').doc(uid).get();
    var data = res.data()!;
    return profile(Profile.fromMap(data));
  }

  handleLogin(String email, String pw) async {
    var res = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: pw,
    );

    print('로그인 성공! ${res.user!.email}');
  }

  handleSignUp(String email, String pw) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: pw,
    );
    print('회원가입 성공!');
    Get.snackbar('회원 가입완료!', '서비스를 누리세요!');
  }

  handelLogout() async {
    await FirebaseAuth.instance.signOut();
    print('로그아웃 성공!');
  }

  // 구글 로그인 하기 위한 함수
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      super.onInit();
      user(event);
      if (event != null) {
        if (Get.currentRoute != Routes.home) {
          Get.offAllNamed(Routes.home);
        }
        print('로그인이 되어있습니다');
        return;
      }
      if (Get.currentRoute != Routes.login) {
        Get.offAllNamed(Routes.login);
      }
      print('로그인이나 회원가입이 필요합니다');
    });
  }

  checkEmailVerification() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.emailVerified;
    }
  }
}
