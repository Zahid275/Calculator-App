import 'dart:async';

import 'package:calculator_2/Home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return SplasScreenState();
  }
}

class SplasScreenState extends State<SplashScreen>{

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
       return const Home();
      },));


    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.white,
        child: Center(
          child: SizedBox(
            width: 300,
            child: Image.asset('assets/z_apps.png'),
            
            
          ),
        ),

      ),
    );
  }

}