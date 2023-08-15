import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import 'blood_type.dart';

class Doner extends StatefulWidget {
  const Doner({super.key,required this.blood_type});
 final blood_type;
  @override
  State<Doner> createState() => _DonerState();
}

class _DonerState extends State<Doner> {
  String bloodGroup = 'A+';
  var items = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Doner_Data');
  final editname = TextEditingController();
  late final editContact = TextEditingController();
  final editAddress =TextEditingController();
  final editAge = TextEditingController();
  final edditBloodGroup = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkRed(),
        title: Text('Doner',style: TextStyle(color: Colors.white),),
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
            SizedBox(height: 10,),
            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  final Blood_Group = snapshot.child('Blood_Group').value.toString();
                  final Name = snapshot.child('Name').value.toString();
                  final Contact = snapshot.child('Contact').value.toString();
                  final Age = snapshot.child('age').value.toString();
                  final Address = snapshot.child('Address').value.toString();
                  final id = snapshot.child('id').value.toString();
                  if (Blood_Group.toLowerCase().contains(widget.blood_type.toLowerCase().toString())) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        child: ListTile(
                          trailing: PopupMenuButton(
                            icon: Icon(Icons.more_vert_outlined),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: () {
                                    setState(() {
                                      showDilogBox(Name, Contact, Age, Address, id);
                                    });
                                  },
                                  leading: Icon(Icons.edit),
                                  title: Text('Edit'),
                                ),
                              ),
                              PopupMenuItem(
                                onTap: () {
                                  ref.child(snapshot.child('id').value.toString()).remove();
                                },
                                value: 1,
                                child: ListTile(
                                  leading: Icon(Icons.delete),
                                  title: Text('Delete'),
                                ),
                              ),
                            ],
                          ) ,
                          leading: CircleAvatar(
                            radius: 30,
                            child: Text(
                              snapshot.child('Blood_Group').value.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          title: Text(
                            snapshot.child('Name').value.toString(),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                          ),
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
                      ),
                    );
                  } else {
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
  Future<void> showDilogBox(String Name,String Contact,String Age,String Address,String id)async{
    GlobalKey<FormState> formKey =GlobalKey<FormState>();
    editname.text=Name;
    editContact.text=Contact;
    editAge.text=Age;
    editAddress.text=Address;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:Text('Update'),
            content:SingleChildScrollView(
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Column(
                    children: [
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: editname,
                                decoration:const InputDecoration(
                                    prefixIcon: Icon(Icons.person_outline_rounded),
                                    hintText: 'Name'
                                ) ,
                                validator: (value) {
                                  if(value!.isEmpty){
                                    return 'Enter Name';
                                  }},
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'^[a-zA-Z ]*$'), // Pattern for allowing only letters and spaces
                                  ),
                                ],
                              ),
                              const  SizedBox(height: 20,),
                              TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: editContact,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.phone_outlined),
                                    hintText: 'Contact',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Contact';
                                    }
                                    if (!_isValidPhoneNumber(value)) {
                                      return 'Invalid Contact';
                                    }
                                    return null;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^[0-9]*$'), // Pattern for allowing only numeric digits
                                    ),
                                  ],
                                ),
                              const    SizedBox(height: 20,),
                        TextFormField(
                                  controller: editAddress,
                                  decoration:const InputDecoration(
                                      prefixIcon: Icon(Icons.home_outlined),
                                      hintText: 'Address'
                                  ) ,
                                  validator: (value) {
                                    if(value!.isEmpty){
                                      return 'Enter Address';
                                    }},
                                ),

                              const   SizedBox(height: 20,),
                               TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: editAge,
                                  decoration:const InputDecoration(
                                      prefixIcon: Icon(Icons.timeline_outlined),
                                      hintText: 'Age'
                                  ) ,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Age';
                                    }
                                    if (!_isValidAge(value)) {
                                      return 'Invalid Age';
                                    }
                                    return null;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^[0-9]*$'), // Pattern for allowing only numeric digits
                                    ),
                                    LengthLimitingTextInputFormatter(2),
                                  ],
                                ),

                              const   SizedBox(height: 20,),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              TextButton(onPressed: (){
                if(formKey.currentState!.validate()){
                  ref.child(id).update({
                    'Name': editname.text.toLowerCase(),
                    'Address': editAddress.text.toLowerCase(),
                    'Contact': editContact.text.toLowerCase(),
                    'age': editAge.text.toLowerCase(),
                  });
                }
                Navigator.pop(context);
              }, child: Text('Edit')),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Cancel'))
            ],
          );
        },
    );
  }
  bool _isValidPhoneNumber(String input) {
    const int desiredLength = 11;
    final numericOnly = input.replaceAll(RegExp(r'\D'), '');
    return numericOnly.length == desiredLength;
  }
  bool _isValidAge(String input) {
    final int age = int.tryParse(input) ?? -1; // Parse age as integer, default to -1 if not valid
    const int minAge = 0; // Minimum age
    const int maxAge = 150; // Maximum age
    return age >= minAge && age <= maxAge;
  }
}

