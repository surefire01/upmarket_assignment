import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:upmarket_assignment/providers/auth_provider.dart';
import 'package:upmarket_assignment/services/authentication_service.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Form(
              key: provider.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "UpMarket Assign",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      decoration: InputDecoration(
                          prefixIcon: SizedBox(
                            width: 50,
                            child: Row(
                              children: const [
                                Text("   +91 "),
                                Text(
                                  "|",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                          helperText: "Please Enter your Mobile Number"),
                      validator: (val) {
                        if (val == null) {
                          return "Please enter valid mobile number";
                        }
                        provider.mobile = val;
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(padding: EdgeInsets.all(12)),
                      onPressed: () async {
                        if (provider.formKey.currentState!.validate()) {
                          AuthenticationService.sendOtp(provider.mobile,
                              () async {
                            await provider.verifyOtp(context);
                          });
                        }
                      },
                      child: const Text(
                        "Send OTP",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
