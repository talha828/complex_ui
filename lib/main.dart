import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'PmButtom.dart';
import 'event.dart';
import 'package:intl/intl.dart';
import 'confirm_Page.dart';
import 'button.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DateTimePicker(),
    );
  }
}

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({ Key key }) : super(key: key);

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();

  bool colorChecker=true;
  TimeOfDay now ;
  String houres; 
  String mints;
  String pmOrAm;



   Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  String focusedDay = DateTime.now().toString();
  DateTime getDate = DateTime.now();
 

  TextEditingController _eventController = TextEditingController();


  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedEvents = {};
 now =TimeOfDay.now();
houres=now.hour.toString();
mints= now.minute.toString();
pmOrAm=(int.parse(houres)>11)?"PM":"AM";
int num=int.parse(houres)-12;
houres=(int.parse(houres)>12)?num.toString():houres;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      body:SingleChildScrollView(
        child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Row(
              children:[
 Text(
            "Date: ${getDate.toString().substring(0,10) }  ",
            style: TextStyle(
                fontSize: 26.0,
                color: Colors.black,
                fontWeight: FontWeight.bold
               ),
          ),            
             Text("${DateFormat('EEEE').format(getDate).toString().substring(0,3).toUpperCase()}",style:TextStyle(fontSize: 26,color:Color(0xffcc337c),fontWeight: FontWeight.bold)),
              ]
            ),
          ),
            Container(
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
                BoxShadow(
                  blurRadius: 3.0,
                  color: Colors.grey,
                  spreadRadius: 3.0,
                  offset: Offset(0.4, 4.0), // shadow direction: bottom right
                )
              ],),
              margin: EdgeInsets.all(30),
              child: TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  getDate = selectDay;
                  selectedDay=selectDay;
                  focusedDay = focusDay.toString();
                });
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

              eventLoader: _getEventsfromDay,

              //To style the Calendar
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Row(
              children:[
                Text("Time: $houres"+" : "+"$mints ",style:TextStyle(fontSize: 26,fontWeight: FontWeight.bold)),
                Text("$pmOrAm",style:TextStyle(fontSize: 26,color:Color(0xffcc337c),fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                  spreadRadius: 3.0,
                  offset: Offset(0.4, 4.0), // shadow direction: bottom right
                )
              ],

              
            ),
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child:Text("ENTER TIME",style: TextStyle(color: Colors.grey[600],fontSize: 17),)),
             SizedBox(height: 10,),
             Container(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                    TextFieldForTime(
                      controller: controller1,
                      onchange: (value){
                      houres=value.toString();
                    },text: "Houres",),
                  Container(width: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(".",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),),
                    ),
                    SizedBox(height: 3,),
                     Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(".",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),),
                    ),
                    
                  ],),
                  ),
                 TextFieldForTime(
                   controller: controller2,
                   onchange: (value){
                   mints=value.toString();
                 },text:"Mints"),
                 Column(children: [
                   PmButton(text: "PM",
                   textColor:(colorChecker==true?Color(0xffcc337c):Colors.grey),
                   borderColor: (colorChecker==true?Color(0xffcc337c):Colors.grey),
                   backgroundColor: (colorChecker==true?Color(0xfff3e7ff):Colors.white),
                   onTap: (){
                     setState(() {
                       colorChecker=(colorChecker==true?false:true);
                     });
                      pmOrAm="PM";
                   },),
                     PmButton(text: "AM",
                   textColor:(colorChecker==false?Color(0xffcc337c):Colors.grey),
                   borderColor: (colorChecker==false?Color(0xffcc337c):Colors.grey),
                   backgroundColor: (colorChecker==false?Color(0xfff3e7ff):Colors.white),
                   onTap: (){
                     setState(() {
                       colorChecker=(colorChecker==true?false:true);
                     });
                      pmOrAm="AM";
                   },),
                   SizedBox(height: 20,)
                 ],)
                 ],
               ),
             ),
             Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
               child: Row(
                 mainAxisAlignment:MainAxisAlignment.spaceBetween,
                 children: [
                 Icon(Icons.alarm,size: 30,color: Colors.grey,),
                 SizedBox(width: 10,),
                 Button(text: "CANCLE",onTap: (){
                   setState(() {
                     controller1.clear();
                     controller2.clear();
                      now =TimeOfDay.now();
houres=now.hour.toString();
mints= now.minute.toString();
pmOrAm=(int.parse(houres)>11)?"PM":"AM";
int num=int.parse(houres)-12;
houres=(int.parse(houres)>12)?num.toString():houres;
                   });
                 },),
                 Button(text: "OK",onTap: (){
                   setState(() {
                     houres=houres;
                     mints=mints;
                     pmOrAm=pmOrAm;

                   });
                 },)
               ],),
             )
            ],
          ),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                InkWell(onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmBooking(
                  date:getDate.toString().substring(0,10),
                  day:DateFormat('EEEE').format(getDate).toString().substring(0,3).toUpperCase(),
                  am:pmOrAm ,
                  houres:houres ,
                  mint: mints,
                  ))),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 100),
                    decoration: BoxDecoration(
                      color:  Color(0xfff5207d),
                      borderRadius:BorderRadius.circular(10),
                    ),
                    child: Text("Book Now",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:Colors.white),),),
                ),
              ],
            ),
          )
        ],),
          ),
      ),) );
  }
}

