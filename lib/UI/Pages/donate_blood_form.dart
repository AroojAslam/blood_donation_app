


import 'package:blood_donation_app/UI/Pages/chose_type.dart';
import 'package:blood_donation_app/UI/constants.dart';
import 'package:flutter/material.dart';

class BloodDonation extends StatefulWidget {
  const BloodDonation({super.key});

  @override
  State<BloodDonation> createState() => _BloodDonationState();
}

class _BloodDonationState extends State<BloodDonation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: darkRed(),
            title: Text('Donate Blood',style: TextStyle(color: Colors.white),),
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChoosePage(),));
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Expanded(
              child: Center(
                child: Column(

                  children: [
                    SizedBox(height: 30,),
                    Image(
                      height: 150,
                        width: 150,
                        image: AssetImage('assets/images/need_blood.png')),
                    SizedBox(height: 20,),
                    Text('Fill This Form',style: TextStyle(color: darkRed(),fontSize: 25,fontWeight: FontWeight.bold),),
                    Text('If you want to donate the Blood',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),),
                    SizedBox(height: 20,),
                    Form(child: Column(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                             decoration:InputDecoration(
                               hintText: 'Name'
                             ) ,
                        ),
                        ),
                        SizedBox(height: 20,),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            decoration:InputDecoration(
                                hintText: 'Contact'
                            ) ,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            decoration:InputDecoration(
                                hintText: 'Address'
                            ) ,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            decoration:InputDecoration(
                                hintText: 'Blood Group'
                            ) ,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            decoration:InputDecoration(
                                hintText: 'Age'
                            ) ,
                          ),
                        ),
                        SizedBox(height: 20,),
                      ],
                    )),
                    SizedBox(height: 20,),
                    MyButton(
                      'Add',
                          () {

                      },
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ) ,
    )
    );
  }
}
