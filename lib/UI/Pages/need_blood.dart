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
    return SafeArea(child:
    Scaffold(
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
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
        return ListTile(

          leading:CircleAvatar(
            radius: 50,
            child: Text('A+',style: TextStyle(fontSize: 20,),),
          ) ,
          title:Text('Name',style: TextStyle(fontSize: 20)) ,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Contant'),
              Text('Age'),
              Text('Address'),
            ],
          ),

        );
      },),
    ));
  }
}
