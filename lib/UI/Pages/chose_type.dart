
import 'package:blood_donation_app/UI/constants.dart';
import 'package:blood_donation_app/UI/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'blood_type.dart';
import 'donate_blood_form.dart';

class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  final auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: darkRed(),
            title:const Text('Blood Donation',style: TextStyle(color: Colors.white)),
            actions: [
              IconButton(onPressed: (){
                setState(() {
                  _showSuccessDialog(context);
                });
              }, icon:const Icon(Icons.logout, color:Colors.white))
            ],
          ),
          backgroundColor: Colors.grey.shade50,
          body: SafeArea(
            child: Center(
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customCard(
                      Colors.red.shade200,
                        "assets/images/need_blood.png",
                      "Need Blood",
                      Colors.red.shade900,
                      (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>const BloodTyps(),));
                      }
                    ),
                  const  SizedBox(height: 30),
                    customCard(
                      Colors.blue,
                        "assets/images/Blood_donation.png",
                      "Donate Blood",
                      Colors.blue.shade800,
                            (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BloodDonation(),));
                        }
                    ),

                  ],
                ),
              ),
          )
        ),
    )  ;
  }
  void _showSuccessDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:const  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.0),
              Text(
                'Are You Sure !\nyou want to LogOut',
                style: TextStyle(fontSize: 18.0),textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                auth.signOut().then((value) => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(),))
                });
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
               Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
