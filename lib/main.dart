import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upmarket_assignment/providers/auth_provider.dart';
import 'package:upmarket_assignment/providers/user_details_provider.dart';
import 'package:upmarket_assignment/theme/app_theme_data.dart';
import 'package:upmarket_assignment/view/authentication%20_view.dart';

import 'view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserDetailsProvider()),
      ],
      child: MaterialApp(
        theme: CustomAppThemeData.themeData,
        home: const Authenticate(), //Home(),
      ),
    );
  }
}
