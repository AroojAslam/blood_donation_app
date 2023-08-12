
import 'dart:async';

import 'package:blood_donation_app/UI/Auth/login_page.dart';
import 'package:flutter/material.dart';

import 'Pages/chose_type.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn(),));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 150,
                width: 150,
                image: AssetImage("assets/images/splashScreen.png")),
            SizedBox(height: 20,),
            Text('Blood Donation', style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
            color: Color.fromRGBO(197, 63, 63, 1), ),)
          ],
        ),
      )
    );
  }
}
