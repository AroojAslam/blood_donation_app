


import 'package:blood_donation_app/UI/Pages/chose_type.dart';
import 'package:blood_donation_app/UI/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BloodDonation extends StatefulWidget {
  const BloodDonation({super.key});

  @override
  State<BloodDonation> createState() => _BloodDonationState();
}

class _BloodDonationState extends State<BloodDonation> {
  bool loading =false;
  final databaseref = FirebaseDatabase.instance.ref('Doner_Data');
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
  Function(dynamic value) valid() {
    return (value) {
      if (value!.isEmpty) {
        return value;
      }
    };
  }
  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final addressController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final ageController = TextEditingController();
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  final auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: darkRed(),
            title: const Text('Donate Blood',style: TextStyle(color: Colors.white),),
            leading: IconButton(
              icon:const Icon(Icons.arrow_back,color: Colors.white),
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
                 const   SizedBox(height: 30,),
                   const Image(
                      height: 150,
                        width: 150,
                        image: AssetImage('assets/images/need_blood.png')),
                  const  SizedBox(height: 20,),
                    Text('Fill This Form',style: TextStyle(color: darkRed(),fontSize: 25,fontWeight: FontWeight.bold),),
                  const  Text('If you want to donate the Blood',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),),
                  const  SizedBox(height: 20,),
                    Form(
                      key: formKey,
                        child: Column(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: nameController,
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
                        ),
                      const  SizedBox(height: 20,),
                        Padding(padding:const EdgeInsets.symmetric(horizontal: 20),
                          child:TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: contactController,
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
                        ),
                    const    SizedBox(height: 20,),
                        Padding(padding:const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: addressController,
                            decoration:const InputDecoration(
                                prefixIcon: Icon(Icons.home_outlined),
                                hintText: 'Address'
                            ) ,
                            validator: (value) {
                              if(value!.isEmpty){
                                return 'Enter Address';
                              }},
                          ),
                        ),
                     const   SizedBox(height: 20,),
                        Padding(padding:const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: ageController,
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
                        ),
                      const  SizedBox(height: 20,),
                        Padding(padding:const EdgeInsets.symmetric(horizontal: 20),
                          child:  DropdownButton(
                                  underline: Container(
                                    height: 2,
                                    color: darkRed(),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  hint:Text('Select Blood Group'),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: darkRed()
                                  ),
                                  isExpanded: true,
                                  value: bloodGroup,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(

                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      bloodGroup = newValue!;
                                    });
                                  }
                              ),

                        ),

                     const   SizedBox(height: 20,),
                      ],
                    )),
                  const  SizedBox(height: 20,),
                    MyButton(
                      loading: loading,
                      context: context,
                      text: 'Add',
                      ontap:   () {
                      if(formKey.currentState!.validate()){
                        setState(() {
                          loading=true;
                        });
                        databaseref.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                            'Name': nameController.text.toString(),
                            'Address': addressController.text.toString(),
                            'Contact': contactController.text.toString(),
                            'age': ageController.text.toString(),
                            'Blood_Group': bloodGroup.toString(),
                          }
                        ).then((value) {
                          _showSuccessDialog(context);
                          setState(() {
                            loading=false;
                          });
                        }).onError((error, stackTrace){
                          Utils().toastmessage(error.toString());
                          setState(() {
                            loading=false;
                          });
                        });

                      }
                      },
                    ),
                 const   SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ) ,
    )
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
  void _showSuccessDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:const  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 48.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'You are added',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChoosePage(),));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
