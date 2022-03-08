import 'package:flutter/material.dart';


class PmButton extends StatelessWidget {
  PmButton({this.backgroundColor,this.borderColor,this.text,this.textColor,this.onTap});
final text;
final borderColor;
final textColor;
final backgroundColor;
final onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(5)
      ),
      padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Text(text,style: TextStyle(color:textColor,fontSize: 18, fontWeight: FontWeight.bold),),
      ),
    );
  }
}

class TextFieldForTime extends StatelessWidget {
  TextFieldForTime({this.onchange,this.text,this.controller});
final onchange;
final text;
final controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
         width: 110,
         height: 110,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      child: TextField(
                        controller: controller,
                        scrollPadding: EdgeInsets.all(10),
                        style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                        onChanged: onchange,
        textAlign: TextAlign.center,
        cursorColor: Colors.purpleAccent,
        // strutStyle: StrutStyle(height: 3),
        decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.purpleAccent,width: 3 )),
          border: OutlineInputBorder(borderSide: BorderSide(color:Color(0xffeeeeee),width: 3 )),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Color(0xffeeeeee),width: 3 )),
          fillColor: Color(0xffeeeeee),
          
        ),
                      ) ,),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         child: Container(child:Text(text,style: TextStyle(color: Colors.grey[600],fontSize: 14),)),
       ),
      ],
    );
  }
}