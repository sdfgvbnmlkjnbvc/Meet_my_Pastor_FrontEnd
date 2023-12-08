
import "package:flutter/material.dart";
import "package:meet_my_pastor/page_navigator.dart";
import "package:meet_my_pastor/provider/apointment.dart";
import "package:meet_my_pastor/view/screens/appointment_detail.dart";
import "package:meet_my_pastor/view/screens/read_appointment.dart";
import "package:meet_my_pastor/widgets/data_control.dart";
import "package:provider/provider.dart";


class Controlpage extends StatefulWidget {
  const Controlpage({super.key});

  @override
  State<Controlpage> createState() => _ControlpageState();
}

class _ControlpageState extends State<Controlpage> {
  @override
  Widget build(BuildContext context) {
    var dataStream =Provider.of<AppointmentProvider>(context);
    return  SingleChildScrollView(child: 
    Padding(
      padding: const EdgeInsets.all(30.0),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
        // Center(
        //   child: Row(
        //       children: [
        //          data_control(data: "Users",number: "23",circleColor: const Color.fromARGB(179, 62, 101, 255),),const Spacer(),
        //          data_control(data: "Appoints",number: "23",circleColor: const Color.fromARGB(179, 62, 101, 255),),const Spacer(),
        //          data_control(data: "Events",number: "23",circleColor: const Color.fromARGB(179, 62, 101, 255),),
        //       const  Spacer()
        //       // , data_control(data: "User",number: "23",CircleColor: const Color.fromARGB(179, 62, 101, 255),),
        //       ],
        //     ),
        // ),
        const SizedBox(height: 15,),
          Container(
            width:MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(179, 62, 101, 255),

            ),
            
            height: 180,


            child: Column(children: [
            
              const Center(child: Text(
                "View the Appointment booked",
              style: TextStyle(  fontFamily: "Montserrat",
        decoration: TextDecoration.none,
                  fontSize: 18, fontWeight: FontWeight.bold,
                  color: Colors.white),
                  ),
                  ),
              Center(child: TextButton.icon(onPressed: (){}, icon:
              const Icon(Icons.open_in_full), 
              label: const Text("Open",
              style: TextStyle(
                fontFamily: "Montserrat",
        decoration: TextDecoration.none,
                  fontSize: 24, fontWeight: FontWeight.bold,
                  color: Colors.white),
            
                  ),

                  ),
               ),
               const Spacer(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 data_control(data: "Users",iconData:const Icon(Icons.person_4),circleColor:Colors.white,),
                 data_control(data: "pastors",iconData:const Icon(Icons.book),circleColor:Colors.white,),
                 data_control(data: "Events",iconData: const  Icon(Icons.person_4),circleColor: 
              Colors.white),
                 data_control(data: "testimony",iconData: const Icon(Icons.person_4),circleColor: 
        Colors.white,),
                  data_control(data: "Appoints",iconData:const  Icon(Icons.book),circleColor:Colors.white),

              ],
            ),
          const SizedBox(height: 20,)
            ]),
            
          ),const SizedBox(height: 12,),
          Container(
            width:MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(179, 124, 128, 143),

            ),
            
            height: 180,


            child: Column(children: [
            
              const Center(child: Text(
                "Users",
              style: TextStyle(  fontFamily: "Montserrat",
        decoration: TextDecoration.none,
                  fontSize: 18, fontWeight: FontWeight.bold,
                  color: Colors.white),
                  ),
                  ),
              Center(child: TextButton.icon(onPressed: (){}, icon:
              const Icon(Icons.open_in_full), 
              label: const Text("Open",
              style: TextStyle(
                fontFamily: "Montserrat",
        decoration: TextDecoration.none,
                  fontSize: 24, fontWeight: FontWeight.bold,
                  color: Colors.white),
            
                  ),

                  ),
               ),
               const Spacer(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 data_control(data: "Users",iconData:const Icon(Icons.person_4),circleColor:Colors.white,),
                 data_control(data: "Appoints",iconData:const Icon(Icons.book),circleColor:Colors.white,),
                 data_control(data: "Events",iconData: const  Icon(Icons.person_4),circleColor: 
              Colors.white),
                  data_control(data: "Appoints",iconData:const  Icon(Icons.book),circleColor:Colors.white),
                 data_control(data: "Events",iconData: const Icon(Icons.person_4),circleColor: 
        Colors.white,),

              ],
            ),
          const SizedBox(height: 20,)
            ]),
            
          ),
          const SizedBox(height: 10,),
           const Text("Booked Appointments",style:  TextStyle(  fontFamily: "Montserrat",
                    fontSize: 18, fontWeight: FontWeight.bold,decoration: TextDecoration.none,
                    color:Colors.black),),
const SizedBox(height: 10,),

         Container(height:200,width: 500,
           child:
           StreamBuilder(stream:dataStream.Appointments(context: context), initialData: {"progress":"loading"},
            builder: (context, snapshot) {
           if (
            snapshot.hasData == true && dataStream.respData['Appointment'] !=null ) {
              print(" ----- checking end ponit data == ${dataStream} --------  ");

              //  return               
                final appointmentsData =
                                    dataStream.respData['Appointment'];
                                    return ListView.builder(
                                      itemCount: appointmentsData.length,
                                     itemBuilder: (context, index) {
                                        return SingleChildScrollView(
                                          child: Material(child:  Column(
                                            children: [
                                              InkWell(child: ListTile(leading: CircleAvatar(radius: 25),title:Text(appointmentsData[index]['name'].toString()),subtitle: Text(appointmentsData[index]['email'].toString(), ),trailing: Text(appointmentsData[index]['time'].toString()),),onTap:(){
                                                
                                              PageNavigator(ctx:context)
            .nextPage(page:  readAppointment(name:Text(appointmentsData[index]['name'],style: const TextStyle(decoration:TextDecoration.none ,
                          fontFamily: "Montserrat",
                           color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),time:Text("Time: ${appointmentsData[index]['time']}",style: const TextStyle(
                          fontFamily: "Montserrat",
                          decoration:TextDecoration.none ,
                           color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal)) ,date:Text("Date: ${appointmentsData[index]['Date']} ",style: const TextStyle(
                          fontFamily: "Montserrat",
                           color: Colors.black,
                           decoration:TextDecoration.none ,
                            fontSize: 18,
                            fontWeight: FontWeight.normal))  ,pastor:Text(appointmentsData[index]['Pastor'],style: const TextStyle(
                          fontFamily: "Montserrat",
                           color: Colors.black,decoration:TextDecoration.none ,
                            fontSize: 18,
                            fontWeight: FontWeight.normal))  ,msg:Text("${appointmentsData[index]['msg']}",style: const TextStyle(decoration:TextDecoration.none ,
                          fontFamily: "Montserrat",
                           color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.normal)
            
            
            ),
            ),
            );
                                              } 

                                              ),
                                            Container(height: 5,color:Colors.white)
                                            ],
                                          )),
                                        );
                                      }
                                    );
            
           }else{
            
           return const Material(child:  Center(child: ListTile(title:Text("Loading ...."),subtitle: Text("please wait", ),trailing: CircularProgressIndicator(),)));
           Text("NO data");
           }
            
           }
              // print(dataStream.toString());
           // return Container(height: 30,width: 180,child: Text("Hello world"),);
           
           
           ,
// const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),))
//      ,SizedBox(height: 5,),
//      const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),)),SizedBox(height: 5,)
//       ,const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),)),SizedBox(height: 5,)
//       ,const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),)),SizedBox(height: 5,)
//       ,const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),)),SizedBox(height: 5,)
//           ,const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),)),SizedBox(height: 5,)
//       ,const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),)),SizedBox(height: 5,)
         
           )
         )
        ]
          )
      ),
    );
  
  }
}

