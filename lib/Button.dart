import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  Color? btnColor;
  String btnText;
  Color txtColor;
  void Function()? onPressed;

  MyButton({super.key, this.btnColor = Colors.deepPurpleAccent,required this.btnText,required this.onPressed , required this.txtColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(

        decoration: BoxDecoration(
            color: btnColor,
          borderRadius: BorderRadius.circular(11),
          boxShadow: const [BoxShadow(blurRadius: 1,)]

        ),

        child: Center(child: Text(btnText,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: txtColor),)),

      ),
    );

  }


}