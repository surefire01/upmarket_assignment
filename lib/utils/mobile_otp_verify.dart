import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

Future<void> VerifyOTP(BuildContext context) async {
  // ignore: inference_failure_on_function_invocation

  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
      title: Text("Verify OTP"),
      content: PinCodeTextField(
        mainAxisAlignment: MainAxisAlignment.center,
        cursorColor: Colors.blue,
        pinTheme: PinTheme(
          fieldOuterPadding: EdgeInsets.all(5),
          borderWidth: 1.2,
          activeColor: Colors.black,
          selectedColor: Colors.black,
          inactiveColor: Colors.black,
        ),
        appContext: context,
        length: 4,
        onChanged: (otp) {},
      ),
      actions: [
        TextButton(
            onPressed: () {},
            child: Text("Resend OTP", style: TextStyle(color: Colors.grey))),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Submit",
              //style: TextStyle( color: Colors.green),
            ))
      ],
    ),
  );

  return;
}
