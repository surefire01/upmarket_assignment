import 'package:firebase_auth/firebase_auth.dart';
import 'package:upmarket_assignment/utils/toast_msg.dart';

class AuthenticationService {
  static final auth = FirebaseAuth.instance;
  static String verifyId = "";

  static Future<void> sendOtp(String mobileNumber, Function onCodeSent) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+91 $mobileNumber',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        showToastMsg(e.code);
      },
      codeSent: (String verificationId, int? resendToken) {
        showToastMsg("otp sent");
        verifyId = verificationId;
        onCodeSent();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  static Future<void> verifyOtp(String otp) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);
    await auth.signInWithCredential(credential);
    showToastMsg("User Verified");
  }

  static Stream<User?> get user {
    return auth.authStateChanges();
  }

  static Future<void> logout() async {
    auth.signOut();
  }
}
