
import 'package:blood_donation_app/UI/Pages/donar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'chose_type.dart';

class BloodTyps extends StatefulWidget {
  const BloodTyps({super.key});

  @override
  State<BloodTyps> createState() => _BloodTypsState();
}

class _BloodTypsState extends State<BloodTyps> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Doner_Data');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkRed(),
        title:const Text('Blood Type',style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon:const Icon(Icons.arrow_back,color: Colors.white),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChoosePage(),));
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(

            children: [
              const  Image(
                  height: 250,
                  width: 250,
                  image: AssetImage('assets/images/blood_type.png')),
              const SizedBox(height: 20,),
              Text('Select Blood Type',style: TextStyle(color: darkRed(),fontSize: 25,fontWeight: FontWeight.bold),),
              const  Divider(endIndent: 35,indent: 35),

              const  SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bloodGroupCard(
                    "A+",
                        () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>const Doner(blood_type: 'A+'),));
                    },
                  ),
                  const    SizedBox(height: 30),
                  bloodGroupCard(
                    "A-",
                        () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const Doner(blood_type: 'A-'),));
                    },
                  ),
                ],),
              const  SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bloodGroupCard(
                    "B+",
                        () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const Doner(blood_type: 'B+'),));
                    },
                  ),
                  const   SizedBox(height: 30),
                  bloodGroupCard(
                    "B-",
                        () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const Doner(blood_type: 'B-'),));
                    },
                  ),
                ],),
              const   SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bloodGroupCard(
                    "AB+",
                        () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const Doner(blood_type: 'AB+'),));
                    },
                  ),
                  const  SizedBox(height: 30),
                  bloodGroupCard(
                    "AB-",
                        () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const Doner(blood_type: 'AB-'),));
                    },
                  ),
                ],),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bloodGroupCard(
                    "O+",
                        () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const Doner(blood_type: 'O+'),));
                    },
                  ),
                  const   SizedBox(height: 30),
                  bloodGroupCard(
                    "O-",
                        () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const Doner(blood_type: 'O-'),));
                    },
                  ),
                ],),
            ],
          ),
        ),
      ),
    );
  }
}
