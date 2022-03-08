import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  Button({this.onTap,this.text});
final text;
final onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xfff5207d)),),),
    );
  }
}