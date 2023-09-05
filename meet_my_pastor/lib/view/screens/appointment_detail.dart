import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentDetail extends StatelessWidget {
  
  AppointmentDetail({super.key});
  DateTime selectedDate = DateTime.now();
     List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    // DateTime.now().add(const Duration(days: 5)),
  ];
  _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //     context: context,
  //  initialDate: selectedDate,
  //  firstDate: DateTime.utc(2021,10,16),
  //  lastDate: DateTime.utc(2023,10,16),
  //     );
//  final Datepicked = await  TableCalendar(
//   firstDay: DateTime.utc(2010, 10, 16),
//   lastDay: DateTime.utc(2030, 3, 14),
//   focusedDay: DateTime.now(),);
  AlertDialog(title: Text("Date"),content: Text("Hello world"));

Container(
          height: 250,
          width: double.infinity,
          //  color:Colors.blueGrey,
          margin: EdgeInsets.all(20),
        child:   
        CalendarDatePicker2(
          onValueChanged: ((value) {
            print(value);
          }),
  config: CalendarDatePicker2Config(dayTextStyle: TextStyle(color: Color(0xff3E64FF),fontWeight: FontWeight.w900),
  
  weekdayLabelTextStyle: TextStyle(color: Color(0xff3E64FF),fontWeight: FontWeight.w900),
  controlsTextStyle: TextStyle(color: Color(0xff3E64FF),fontWeight: FontWeight.w900),lastMonthIcon: Icon(Icons.arrow_back_ios_sharp,color: Color(0xff3E64FF),),
nextMonthIcon:  Icon(Icons.arrow_forward_ios,color: Color(0xff3E64FF),),
  ),
  initialValue: _rangeDatePickerWithActionButtonsWithValue 
),
        
        );
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Column(
        children: [
      Container(margin: EdgeInsets.only(left:20,right:20),
decoration: BoxDecoration(          borderRadius:BorderRadius.circular(6),color:Colors.white,
boxShadow:  [BoxShadow(
                      color:Colors.grey,
                      offset: const Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),



                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),]
),          //  clipBehavior: Clip.antiAlias,
       
          width: 363,height: 50,
            
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: TextField(clipBehavior: Clip.antiAlias,
                  decoration: InputDecoration(border: InputBorder.none,
                    labelText: "Email",labelStyle: TextStyle(fontSize:24,fontWeight: FontWeight.bold )
                  ),
                 ),
              ),
            ),
          ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child:  Material(
        child: InkWell(splashColor: Colors.transparent,onTap: (){
          _selectDate(context);
        },
          child: Container(decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6)
            
          ),height:60,width: 360,child: Text("Date",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),), )),
      )
       ),
          Container(margin: EdgeInsets.only(left:20,right:20),
decoration: BoxDecoration(          borderRadius:BorderRadius.circular(6),color:Colors.white,
boxShadow:  [BoxShadow(
                      color:Colors.grey,
                      offset: const Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),]
),          //  clipBehavior: Clip.antiAlias,
       
          width: 363,height: 50,
            
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: TextField(clipBehavior: Clip.antiAlias,
                  decoration: InputDecoration(border: InputBorder.none,
                    labelText: "Email",labelStyle: TextStyle(fontSize:24,fontWeight: FontWeight.bold )
                  ),
                 ),
              ),
            ),
          )
        ],
      ),
    );
  }
}