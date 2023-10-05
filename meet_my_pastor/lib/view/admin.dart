import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:meet_my_pastor/pageNavigator.dart';
import 'package:meet_my_pastor/provider/auth/auth_provider.dart';
import 'package:meet_my_pastor/provider/auth/sendimage.dart';
import 'package:meet_my_pastor/provider/event_provider.dart';
import 'package:meet_my_pastor/provider/pastor_provider.dart';
import 'package:meet_my_pastor/provider/testimony_provider.dart';
import 'package:meet_my_pastor/provider/testupload.dart';
import 'package:meet_my_pastor/view/screens/appointment.dart';
import 'package:meet_my_pastor/view/screens/home.dart';

import 'package:meet_my_pastor/widgets/InputTextfield.dart';
import 'package:meet_my_pastor/widgets/authentication.dart';
import 'package:meet_my_pastor/widgets/meettoast.dart';
import 'package:provider/provider.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final TextEditingController dateInput = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
   final TextEditingController _locationController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  List<String> list = [
    "Select Option",
    'Testimony',
    'Event',
    // 'Appointment',
    'Pastor'
  ];
  bool isDateSelected = false;
  String? dropdownValue = "Select Option";

  @override
  void initState() {
    super.initState();
    dateInput.text = "";
  }

  Widget build(BuildContext context) {
    final files = Provider.of<FetchImage>(context,listen: true);
    //  final file = Provider.of<FetchImage>(context);
    final response = Provider.of<CloudImage>(context);
    final addEvent =Provider.of<EventProvider>(context,listen: false);
    final addTestimony =Provider.of<TestimonyProvider>(context,listen: false);
    final addPastor = Provider.of<PastorProvider>(context, listen: false);
    // final Uploaded = Provider.of<CloudImage>(context, listen: true).upload;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              onPressed: () {
                pageNavigator(ctx: context).nextPageOnly(page: Appointment());
              },
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  pageNavigator(ctx: context).nextPageOnly(page: HomePage());
                },
                icon: Icon(color: Colors.blue, Icons.exit_to_app))
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               files.picked ==true
                    ? Flexible(
                      child: 

                      Stack(
      alignment: Alignment.center,
      children: [
        Container(
                    width: 159,
                          height: 210,
                          child: 
                          // Text("${response.response?.secureUrl.toString()}")
                          Image.file(
            files.imageFile,
            height: MediaQuery.of(context).size.width * 0.75,
            scale: 1.0,
            fit: BoxFit.cover,),
            ),
        Positioned(
          bottom: -10,
          right: 0,
          child: Material(
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(100),
              ),
              height: 50,
              width: 50,
              child: InkWell(
                onTap: () async {
                  await files.int();
                },
                child: Icon( color: Colors.blue,
                  Icons.add_circle_outline,
                  size: 55,
                ),
              ),
            ),
          ),
        )
      ],
    ),

                    
                    ): Flexible(
                      child: Container(
                          width: 159,
                          height: 210,
                          color: Color(0xffD9D9D9),
                          child: buildImagePlaceholder(files),
                        ),
                    ),
                Flexible(
                  child: Container(
                    height: 200,
                    width: 192,
                    child: buildDropdownAndFields(),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            dropdownValue == "Pastor"
                ? Text("")
                : Flexible(
                  child: Container(
                      margin: EdgeInsets.all(20),
                      child: FieldInput(  expand:true,
                      maxLines: null,
                      minLines: null,
                
                        labelText: "Kindly Type here",
                        height: MediaQuery.of(context).size.height * 0.4179,
                        controller: _messageController,
                      ),
                    ),
                ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (dropdownValue == 'Pastor') ...[
                  buildRegisterButton(
                    context,
                    () async {
                      if (_nameController.value.text.isEmpty == true ||
                          _titleController.value.text.isEmpty == true ||
                          _contactController.value.text.isEmpty == true) {
                        ShowToast.vitaToast(
                            message: "provide data for all fields",
                            warn: true,
                            long: true);
                      } else {
                        await response.upload(
                            files.file!, "${_nameController.value.text}");
                        print("checkInMy${response.response?.secureUrl}");
                        addPastor.pastor(
                            name: _nameController.value.text,
                            title: _titleController.value.text,
                            contact: _contactController.value.text,
                            imageUrl: "${response.response?.secureUrl}",
                            context: context);
                      }
                    },
                    Color(0xFF3E64FF),
                    "Add",
                    170,
                    59,
                  ),
                  buildRegisterButton(
                    context,
                    () {
                      print("Checking");
                      // _nameController.value.text.isEmpty ==true || _titleController.value.text.isEmpty ==true || _contactController.value.text.isEmpty ==true
                      addPastor.pastor(
                          name: _nameController.value.text,
                          title: _titleController.value.text,
                          contact: _contactController.value.text,
                          imageUrl: "${response.response?.secureUrl}",
                         
                          context: context);
                      print("done Checking");
                    },
                    Color(0xFF3E64FF),
                    "Cancel",
                    170,
                    59,
                  ),
                ] 
                // else if (dropdownValue == 'Appointment') ...[
                //   buildRegisterButton(
                //     context,
                //     () async {
                //       if (_nameController.value.text.isEmpty == true) {
                //         ShowToast.vitaToast(
                //             message: "provide data for all fields",
                //             warn: true,
                //             long: true);
                //       } 
                //       else {
                //         await response.upload(
                //             files.file!, "${_nameController.value.text}");
                //         print("checkInMy${response.url}");
                //       }
                //     },
                //     Color(0xFF3E64FF),
                //     "Add",
                //     170,
                //     59,
                //   ),
                //   buildRegisterButton(
                //     context,
                //     () {},
                //     Color(0xFF3E64FF),
                //     "Cancel",
                //     170,
                //     59,
                //   ),
                // ] 
                else if (dropdownValue == 'Event') ...[
                  buildRegisterButton(
                    context,
                    () async {
                      // print("checkInMy${response.url}");
                      // if (_nameController.value.text == null) {
                      //   ShowToast.vitaToast(
                      //       message: "provide data for all fields",
                      //       warn: true,
                      //       long: true);
                      // }
                      // await response.upload(
                      //     files.file!, "${_nameController.value.text}");
                        await addEvent.event(
                            name: _nameController.value.text,
                           location: _locationController.value.text,
                            date:dateInput.value.text,
                            time:_timeController.value.text,
                            imageUrl: "{response.response?.secureUrl}",
                             eventDescription:_messageController.value.text,
                            context: context);
                      
                     
                    },
                    Color(0xFF3E64FF),
                    "Add",
                    170,
                    59,
                  ),
                  buildRegisterButton(
                    context,
                    () {},
                    Color(0xFF3E64FF),
                    "Cancel",
                    170,
                    59,
                  ),
                ] else if (dropdownValue == 'Testimony') ...[
                  buildRegisterButton(
                    context,
                    () async {
                      print("checkInMy${response.url}");
                      if (_nameController.value.text == null) {
                        ShowToast.vitaToast(
                            message: "provide data for all fields",
                            warn: true,
                            long: true);
                      }
                      // await response.upload(
                      //     files.file!, "${_nameController.value.text}");
                   await addTestimony.testimony(name: _nameController.value.text, title: _titleController.value.text,date: dateInput.value.text, message: _messageController.value.text, imageUrl: "https://live.staticflickr.com/65535/52865825745_0262283cb7_h.jpg", context: context);
                    },
                    Color(0xFF3E64FF),
                    "Add",
                    170,
                    59,
                  ),
                  buildRegisterButton(
                    context,
                    () {},
                    Color(0xFF3E64FF),
                    "Cancel",
                    170,
                    59,
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownAndFields() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: buildDropdown(),
          ),
          // if (dropdownValue == "appointment") ...[
          //   Flexible(
          //     child: FieldInput(
          //        expand: false,
          //        maxLines: 1,
          //       controller: _nameController,
          //       height: MediaQuery.of(context).size.width / 4,
          //       labelText: "Full Name",
          //     ),
          //   ),
          //   Flexible(
          //     child: buildDateInput(),
          //   ),
          //   Flexible(
          //     child: FieldInput(
          //       expand: false,
          //         maxLines: 1,
          //       controller: _timeController,
          //       height: MediaQuery.of(context).size.width / 4,
          //       labelText: "Time",
          //     ),
          //   ),
          // ] 
         if (dropdownValue == "Testimony") ...[
          FieldInput(
          expand: false,
          maxLines: 1,
           controller: _titleController,
           height: 40,
           labelText: "Testimony title",
           ), FieldInput(
          expand: false,
          maxLines: 1,
           controller: _nameController,
           height: 40,
           labelText: "Full name",
           ),
          Expanded(child: buildDateInput())
           
      
         
          ] else if (dropdownValue == "Event") ...[
          FieldInput(
          expand: false,
          maxLines: 1,
           controller: _nameController,
           height: 40,
           labelText: "Event Name",
           ), FieldInput(
          expand: false,
          maxLines: 1,
           controller: _locationController,
           height: 40,
           labelText: "Location",
           ),
          Expanded(child: buildDateInput()),
           
          FieldInput(
          expand: false,
          maxLines: 1,
           controller: _timeController,
           height: 40,
           labelText: "Time",
           )
         
          ] else if (dropdownValue == "Pastor") ...[
            FieldInput(
               expand: false,
               maxLines: 1,
              controller: _titleController,
              height: 40,
              labelText: "Title",
            ),
            FieldInput(
             expand: false,
             maxLines: 1,
              controller: _nameController,
              height: 40,
              labelText: "Full Name",
            ),
            FieldInput( 
          expand: false,
          maxLines: 1,
              controller: _contactController,
              height: 40,
              labelText: "Contact",
            ),
          ],
        ],
      ),
    );
  }

  Widget buildDropdown() {
    return Material(
      child: DropdownButton(
        value: dropdownValue,
        icon: const Icon(
          Icons.arrow_downward,
          color: Colors.red,
        ),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget buildDateInput() {
    return Container(
      margin: EdgeInsets.only(top: 2),
      height: MediaQuery.of(context).size.width / 4,
      child: Center(
        child: Material(
          child: TextField(
            controller: dateInput,
            decoration: InputDecoration(
              icon: Icon(Icons.calendar_today),
              hintText: "Enter Date",
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2100),
              );

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                setState(() {
                  dateInput.text = formattedDate;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget buildImagePlaceholder(FetchImage files) {
  return Container(
    width: 159,
    height: 187,
    color: Color(0xffD9D9D9),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          width: 120,
          height: 120,
        ),
        Image.asset(
          "images/camera.png",
          width: 96,
          height: 98,
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Material(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(100),
              ),
              height: 30,
              width: 30,
              child: InkWell(
                onTap: () async {
                  await files.int();
                },
                child: Icon(
                  Icons.add_circle_outline,
                  size: 25,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
