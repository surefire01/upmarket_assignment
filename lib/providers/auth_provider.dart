import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String mobile = "";
  String otp = "";

  Future<void> sendOtp() async {
    if (formKey.currentState!.validate()) {
      //send otp
    }
  }

  Future<void> verifyOtp() async {}
}
