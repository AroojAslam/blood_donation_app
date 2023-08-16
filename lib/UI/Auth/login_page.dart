import 'package:blood_donation_app/UI/Auth/signup_page.dart';
import 'package:blood_donation_app/UI/Pages/chose_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool showPassword=true;
  void logIn(){
    if(formKey.currentState!.validate()){
      setState(() {
        loading=true;
      });
      auth.signInWithEmailAndPassword(email: emailController.text.toString(),
          password: passwordController.text.toString()).then((value) => {
        setState(() {
          loading=false;
        }),
        Navigator.push(context, MaterialPageRoute(builder: (context) =>const ChoosePage(),)),
        Utils().toastmessage(value.user!.email.toString())
      }).onError((error, stackTrace) => {
        Utils().toastmessage(error.toString()),
        setState(() {
          loading=false;
        }),

      });
    }
  }
  bool loading=false;
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  final auth =FirebaseAuth.instance;
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
                  const   SizedBox(height: 30,),
                  const   Image(
                      height: 150,
                      width: 150,
                      image: AssetImage('assets/images/need_blood.png')),
                  const  SizedBox(height: 20,),
                  Text('LogIn',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: darkRed()),),
                  const   SizedBox(height: 10,),
                  const    Text('Welcome to Blood Donation',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),),
                  const    SizedBox(height: 20,),
                  Form(
                    key: formKey,
                      child: Column(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: emailController,
                          decoration:const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                              hintText: 'Email'
                          ) ,
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'Enter Email';
                            }
                          },
                        ),
                      ),
                      const   SizedBox(height: 20,),
                      Padding(padding:const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          obscureText: showPassword,
                          controller: passwordController,
                          decoration:InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: showPassword? IconButton(onPressed: (){
                                setState(() {
                                  showPassword=!showPassword;
                                });
                              },
                                  icon: const Icon(Icons.remove_red_eye_outlined)):
                              IconButton(onPressed: (){
                                setState(() {
                                  showPassword=!showPassword;
                                });
                              }, icon:const  Icon(Icons.visibility_off_outlined,)),
                              hintText: 'Password'
                          ) ,
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'Enter Password';
                            }
                          },
                        ),
                      ),
                      const   SizedBox(height: 40,),

                    ],
                  )),
                  const SizedBox(height: 20,),
                  MyButton(
                    context: context,
                    text: 'Log In',
                    loading: loading,
                    ontap: () {
                      logIn();
                    },
                  ),
                  const   SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const   Text('Don\'t have an Account ',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                      }, child:const Text('SignUp'))
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
