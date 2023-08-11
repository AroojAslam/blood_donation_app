import 'package:flutter/material.dart';

import '../constants.dart';
import 'blood_type.dart';

class NeedBlood extends StatefulWidget {
  const NeedBlood({super.key});

  @override
  State<NeedBlood> createState() => _NeedBloodState();
}

class _NeedBloodState extends State<NeedBlood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkRed(),
        title: Text('Need Blood',style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => BloodTyps(),));
          },
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
          return Card(

            child: ListTile(

              leading:CircleAvatar(
                radius: 30,
                child: Text('A+',style: TextStyle(fontSize: 20,),),
              ) ,
              title:Text('Arooj Aslam',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)) ,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(endIndent: 20),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 20,color: Colors.black),
                      SizedBox(width: 15,),
                      Text('0336-7469953'),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                  Image(
                    height: 15,
                       width: 20,
                      image: AssetImage('assets/images/age.png')),
                      SizedBox(width: 15,),
                      Text('35'),

                    ],
                  ),
                 SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                  size: 20,color: Colors.black,),
                  SizedBox(width: 15,),
                  Text('F-Block'),

                ],
              ),
                ],
              ),

            ),
          );
        },),
      ),
    );
  }
}
