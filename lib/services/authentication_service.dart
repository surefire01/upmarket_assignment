import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  static final auth = FirebaseAuth.instance;
  static String verifyId = "";

  static Future<void> sendOtp(String mobileNumber, Function onCodeSent) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+91 $mobileNumber',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
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
    print("SUIIIIII done");
  }

  static Stream<User?> get user {
    return auth.authStateChanges();
  }
}
