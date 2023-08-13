import 'package:blood_donation_app/UI/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    isLogIn(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Image(
              height: 150,
                width: 150,
                image: AssetImage("assets/images/splashScreen.png")),
            SizedBox(height: 20,),

            Text('Blood Donation', style: TextStyle( color: darkRed(),fontSize: 20,
                fontWeight: FontWeight.bold,),)
          ],
        ),
      )
    );
  }
}
