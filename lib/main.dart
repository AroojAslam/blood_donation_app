import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'UI/constants.dart';
import 'UI/splash_screen.dart';

void main()async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
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
      home: const SplashScreen(),
    );
  }
}


