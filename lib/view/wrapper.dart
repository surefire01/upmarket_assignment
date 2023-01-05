import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upmarket_assignment/services/authentication_service.dart';
import 'package:upmarket_assignment/view/home.dart';

import 'authentication _view.dart';

// to check authentication status of user and decide the view to be shown
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: AuthenticationService.user,
        builder: (context, snapshot) {
          return snapshot.data == null ? Authenticate() : const Home();
        });
  }
}
