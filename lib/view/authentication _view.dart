import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upmarket_assignment/providers/auth_provider.dart';

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
                //crossAxisAlignment: CrossAxisAlignment.start,
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
                      decoration: InputDecoration(label: Text("Mobile Number")),
                      validator: (val) {
                        if (val == null) {
                          return "Please enter valid mobile number";
                        }
                        provider.mobile = val;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(padding: EdgeInsets.all(12)),
                      onPressed: () {},
                      child: Text(
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
