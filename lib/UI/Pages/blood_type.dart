
import 'package:blood_donation_app/UI/Pages/need_blood.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'chose_type.dart';

class BloodTyps extends StatefulWidget {
  const BloodTyps({super.key});

  @override
  State<BloodTyps> createState() => _BloodTypsState();
}

class _BloodTypsState extends State<BloodTyps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkRed(),
        title: Text('Blood Type',style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChoosePage(),));
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(

            children: [
              Image(
                  height: 250,
                  width: 250,
                  image: AssetImage('assets/images/blood_type.png')),
              SizedBox(height: 20,),
              Text('Select Blood Type',style: TextStyle(color: darkRed(),fontSize: 25,fontWeight: FontWeight.bold),),
              Divider(endIndent: 35,indent: 35),

              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bloodGroupCard(
                    "A+",
                        () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NeedBlood(),));
                    },
                  ),
                  SizedBox(height: 30),
                  bloodGroupCard(
                    "A-",
                        () {

                    },
                  ),
                ],),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bloodGroupCard(
                    "B+",
                        () {

                    },
                  ),
                  SizedBox(height: 30),
                  bloodGroupCard(
                    "B-",
                        () {

                    },
                  ),
                ],),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bloodGroupCard(
                    "AB+",
                        () {

                    },
                  ),
                  SizedBox(height: 30),
                  bloodGroupCard(
                    "AB-",
                        () {

                    },
                  ),
                ],),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bloodGroupCard(
                    "O+",
                        () {

                    },
                  ),
                  SizedBox(height: 30),
                  bloodGroupCard(
                    "O-",
                        () {

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
