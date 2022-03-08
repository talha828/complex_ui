import 'package:flutter/material.dart';


class ConfirmBooking extends StatefulWidget {
ConfirmBooking({this.houres,this.mint,this.am,this.date,this.day});
final houres;
final mint;
final am;
final date;
final day;

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
String pickUplocation="Liaquatabad NO 1";

String dropLocation="Paf-Keit NNAZ";

String period ="am"; 
String time="09:30 ";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:const [
                         const Text(
                            "confirm your Booking:",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.only(top: 0.0,bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Color(0xffa2a2a2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                              Container(
                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff8c8c8c),
                                ),
                                padding:EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                                child: Text('Talha Iqbal',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),),
                            SizedBox(height: 10,),
                            InfoTitle(title: "PickUp Location:",info: pickUplocation,),
                            InfoTitle(title: "Drop Location:",info: dropLocation,),
                           Row(
                             mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                             children:[
                              InfoTitle(title: "Time:",info: "${widget.houres}:${widget.mint} ${widget.am}",),
                            InfoTitle(title: "Date:",info: "${widget.date.toString()}"+ " ${widget.day.toString()}",),

                           ])
                          ],),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonForConfirmScreen(text: "Cancel",color: Colors.black,onTap: (){},),
                      ButtonForConfirmScreen(text: "Confirm",color: Colors.black,onTap: (){},),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}








class InfoTitle extends StatelessWidget {
  InfoTitle({this.title,this.info});
 final title;
 final info;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 20),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(title,style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 8,),
        Text(info,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300,color: Colors.white),),
          SizedBox(height: 15,),

        ],) ,);
  }
}

class ButtonForConfirmScreen extends StatelessWidget {
 ButtonForConfirmScreen({this.text,this.color,this.onTap});
final text;
final color;
final onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 110,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:color
        ),
        child:Text(text,style: TextStyle(color: Colors.white,fontSize: 18),) ,),
    );
  }
}

