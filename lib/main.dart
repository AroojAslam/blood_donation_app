import 'package:flutter/material.dart';

import 'UI/Auth/signup_page.dart';
import 'UI/constants.dart';
import 'UI/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: darkRed()),
        useMaterial3: true,
      ),
      home: SignUp(),
    );
  }
}


