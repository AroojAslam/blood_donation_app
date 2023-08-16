import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color darkRed(){
  return const Color.fromRGBO(167, 2, 34, 1);
}

class Utils{
  Future<void> toastmessage(String message) async {
    Fluttertoast.showToast(
        msg:message ,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}

Widget customCard(Color color, String imagePath, String text, Color textColor,VoidCallback ontap ) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      height: 220,
      width: 220,
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 120,
            width: 120,
            image: AssetImage(imagePath),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: ontap,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 50,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: textColor, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


Widget bloodGroupCard( String text, VoidCallback ontap ) {
  return  GestureDetector(
    onTap: ontap,
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.red.shade900, fontSize: 20),
          ),
        ),
      ),
    ),
  );
}

Widget  MyButton({required String text, required VoidCallback ontap, bool loading=false, required BuildContext context} ){
  return  GestureDetector(
    onTap:ontap ,
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(color: darkRed(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: loading ?const CircularProgressIndicator(color: Colors.white,):
        Center(child: Text(text,style:const TextStyle(color: Colors.white,fontSize: 18),)),
      ),
    ),
  );
}