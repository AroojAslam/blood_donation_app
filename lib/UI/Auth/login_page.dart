import 'package:blood_donation_app/UI/Auth/signup_page.dart';
import 'package:blood_donation_app/UI/Pages/chose_type.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: darkRed(),
        title: Text('Blood Donation',style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Center(
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  Image(
                      height: 150,
                      width: 150,
                      image: AssetImage('assets/images/need_blood.png')),
                  SizedBox(height: 20,),
                  Text('LogIn',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: darkRed()),),
                  SizedBox(height: 10,),
                  Text('Welcome to Blood Donation',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),),
                  SizedBox(height: 20,),
                  Form(
                    key: formKey,
                      child: Column(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: emailController,
                          decoration:InputDecoration(
                              hintText: 'Email'
                          ) ,
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'Enter Email';
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: passwordController,
                          decoration:InputDecoration(
                              hintText: 'Password'
                          ) ,
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'Enter Password';
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 40,),

                    ],
                  )),
                  SizedBox(height: 20,),
                  MyButton(
                    'Log In',
                    () {
                      if(formKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChoosePage(),));
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an Account ',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                      }, child: Text('SignUp'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ) ,
      ),
    );
  }
}
