
import "package:flutter/material.dart";
import "package:meet_my_pastor/widgets/data_control.dart";


class Controlpage extends StatefulWidget {
  const Controlpage({super.key});

  @override
  State<Controlpage> createState() => _ControlpageState();
}

class _ControlpageState extends State<Controlpage> {
  @override
  Widget build(BuildContext context) {
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

           
const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),))
     ,SizedBox(height: 5,),
     const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),)),SizedBox(height: 5,)
      ,const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),)),SizedBox(height: 5,)
      ,const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),)),SizedBox(height: 5,)
      ,const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),)),SizedBox(height: 5,)
          ,const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),)),SizedBox(height: 5,)
      ,const Material(child:  ListTile(leading: CircleAvatar(radius: 25),title:Text("Michael Akuetteh"),subtitle: Text("User", ),trailing: Text("data"),)),SizedBox(height: 5,)
         
        
          
        ]
          )
      ),
    );
  
  }
}

