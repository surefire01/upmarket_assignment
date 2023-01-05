import 'package:firebase_auth/firebase_auth.dart';
import 'package:upmarket_assignment/utils/toast_msg.dart';

// Used for phone authentocation
class AuthenticationService {
  static final auth = FirebaseAuth.instance;
  static String verifyId = "";

  // to send otp
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

  // to verify otp
  static Future<void> verifyOtp(String otp) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);
    await auth.signInWithCredential(credential);
    showToastMsg("User Verified");
  }

  // to dynamically get current authentication status
  static Stream<User?> get user {
    return auth.authStateChanges();
  }

  // to logout the user
  static Future<void> logout() async {
    auth.signOut();
  }
}
