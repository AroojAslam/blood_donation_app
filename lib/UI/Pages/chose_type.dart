


import 'dart:io';

import 'package:blood_donation_app/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'blood_type.dart';
import 'donate_blood_form.dart';
import 'need_blood.dart';

class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
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
            title: Text('Blood Donation',style: TextStyle(color: Colors.white)),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BloodTyps(),));
                      }
                    ),
                    SizedBox(height: 30),
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
}
