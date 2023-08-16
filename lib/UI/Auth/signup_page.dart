import 'package:blood_donation_app/UI/Auth/login_page.dart';
import 'package:blood_donation_app/UI/Pages/chose_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showPassword=true;
 void  signUp(){
   if(formKey.currentState!.validate()){
     setState(() {
       loading=true;
     });
     auth.createUserWithEmailAndPassword(
         email: emailController.text.toString(),
         password: passwordController.text.toString()).then((value) => {
       setState(() {
         loading=false;
       }),
       Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn(),)),
     }
     ).onError((error, stackTrace) => {
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
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: darkRed(),
        title: const Text('Blood Donation',style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const SizedBox(height: 30,),
                const  Image(
                      height: 150,
                      width: 150,
                      image: AssetImage('assets/images/need_blood.png')),
                  const SizedBox(height: 20,),
                  Text('SignUp',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: darkRed()),),
                  const SizedBox(height: 10,),
                  const Text('Welcome to Blood Donation',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),),
                  const  SizedBox(height: 20,),
                  Form(
                    key: formKey,
                      child: Column(
                    children: [
                      Padding(padding:const EdgeInsets.symmetric(horizontal: 20),
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
                              prefixIcon:const Icon(Icons.lock_outline),
                              suffixIcon: showPassword? IconButton(onPressed: (){
                                setState(() {
                                  showPassword=!showPassword;
                                });
                              },
                                  icon:const Icon(Icons.remove_red_eye_outlined)):
                              IconButton(onPressed: (){
                                setState(() {
                                  showPassword=!showPassword;
                                });
                              }, icon:const Icon(Icons.visibility_off_outlined,)),
                              hintText: 'Password'
                          ) ,
                          validator: (value) {
                           if(value!.isEmpty){
                             return 'Enter Password';
                           }
                          },
                        ),
                      ),
                      const SizedBox(height: 40,),

                    ],
                  )),
                  const SizedBox(height: 20,),
                  MyButton(
                    context: context,
                    text: 'Sign Up',
                      loading: loading,
                      ontap:   () {
                        signUp();
                    },
                  ),
                  const   SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const  Text('Already have an Account ',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn(),));
                      }, child:const Text('LogIn'))
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
