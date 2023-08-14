import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'blood_type.dart';

class NeedBlood extends StatefulWidget {
  const NeedBlood({super.key,required this.blood_type});
 final blood_type;
  @override
  State<NeedBlood> createState() => _NeedBloodState();
}

class _NeedBloodState extends State<NeedBlood> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Doner_Data');
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
        child: Column(
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                query:ref ,
                itemBuilder: (context, snapshot, animation, index) {
                  final Blood_Group =snapshot.child('Blood_Group').value.toString();
                  if(Blood_Group.toLowerCase().contains(widget.blood_type.toLowerCase().toString())){
                    return  Card(

                      child: ListTile(

                        leading:CircleAvatar(
                          radius: 30,
                          child: Text(snapshot.child('Blood_Group').value.toString(),style: TextStyle(fontSize: 20,),),
                        ) ,
                        title:Text(snapshot.child('Name').value.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)) ,
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(endIndent: 20),
                            Row(
                              children: [
                                Icon(Icons.phone, size: 20,color: Colors.black),
                                SizedBox(width: 15,),
                                Text(snapshot.child('Contact').value.toString()),

                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.timeline_outlined, size: 20,color: Colors.black),
                                SizedBox(width: 15,),
                                Text(snapshot.child('age').value.toString()),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                  size: 20,color: Colors.black,),
                                SizedBox(width: 15,),
                                Text(snapshot.child('Address').value.toString()),

                              ],
                            ),
                          ],
                        ),

                      ),
                    );
                  }else{
                    return Container();
                  }
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}
