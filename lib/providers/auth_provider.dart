import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:upmarket_assignment/services/authentication_service.dart';
import 'package:upmarket_assignment/utils/toast_msg.dart';

class AuthProvider with ChangeNotifier {
  String mobile = "";
  String otp = "";

  // to enter and submit otp
  Future<bool> verifyOtp(BuildContext context) async {
    notifyListeners();
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.black),
        title: const Text("Verify OTP"),
        content: PinCodeTextField(
          mainAxisAlignment: MainAxisAlignment.center,
          cursorColor: Colors.blue,
          pinTheme: PinTheme(
            fieldWidth: 27,
            fieldOuterPadding: const EdgeInsets.all(5),
            borderWidth: 1.2,
            activeColor: Colors.black,
            selectedColor: Colors.black,
            inactiveColor: Colors.black,
          ),
          appContext: context,
          length: 6,
          onChanged: (otp) {
            this.otp = otp;
          },
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  const Text("cancel", style: TextStyle(color: Colors.grey))),
          TextButton(
              onPressed: () async {
                try {
                  await AuthenticationService.verifyOtp(otp);
                  notifyListeners();

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                } catch (e) {
                  showToastMsg("error had occured otp might be inccorect");
                }
              },
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.green),
              ))
        ],
      ),
    );

    return false;
  }
}
