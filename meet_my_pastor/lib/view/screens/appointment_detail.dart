import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meet_my_pastor/provider/Apointment.dart';

import 'package:meet_my_pastor/widgets/authentication.dart';
import 'package:provider/provider.dart';

import '../../pageNavigator.dart';
import '../../provider/auth/auth_provider.dart';
import '../../widgets/InputTextfield.dart';
import 'appointment.dart';
import 'home.dart';

const List<BoxShadow> kInputBoxShadow = [
  BoxShadow(
    color: Colors.grey,
    offset: const Offset(2.0, 2.0),
    blurRadius: 2.0,
    spreadRadius: 2.0,
  ),
  BoxShadow(
    color: Colors.white,
    offset: const Offset(0.0, 0.0),
    blurRadius: 0.0,
    spreadRadius: 0.0,
  ),
];

class AppointmentDetail extends StatefulWidget {
 final  String pastor_id;
  final String title;
  AppointmentDetail({Key? key,required this.pastor_id,required this.title}) : super(key: key
  );

  @override
  _AppointmentDetailState createState() => _AppointmentDetailState();
}

class _AppointmentDetailState extends State<AppointmentDetail> {
  final TextEditingController dateInput = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool isDateSelected = false;

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String User_id = Provider.of<Authentication>(context).user_id;
    print("User id: ${User_id}");
    bool inactive = false;
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            FieldInput(
                expand:false ,
                controller: _emailController,
                width: 363,
                height: 50,
                labelText: "Email"),
            Container(
              margin: const EdgeInsets.only(
                  top: 10, left: 40, right: 40, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                boxShadow: kInputBoxShadow,
              ),
              width: 363,
              height: 40,
              child: Center(
                child: TextField(
                  style: TextStyle(fontSize: 18),
                  controller: dateInput,
                  clipBehavior: Clip.antiAlias,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    border: InputBorder.none,
                    labelText: isDateSelected ? "" : "Enter Date",
                    labelStyle: !isDateSelected
                        ? TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                        : TextStyle(fontSize: 0, fontWeight: FontWeight.bold),
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
                        isDateSelected = true;
                        dateInput.text = formattedDate;
                      });
                    }
                  },
                ),
              ),
            ),
            FieldInput(
                expand:false ,
                controller: _timeController,
                width: 363,
                height: 50,
                labelText: "Time"),
            const SizedBox(
              height: 30,
            ),
            FieldInput(
                expand:true,

              controller: _messageController,
              height: 269,
              width: 363,
              labelText:
                  "Please lets us know in more details your reason for this apointment",
              labelTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Flexible(
                  child: Material(
                    child: Consumer<AppointmentProvider>(
                      builder: (context, Appoint, child) {
                        return buildRegisterButton(context, () {
                          print("User id: $User_id");
                          if (_nameController.value.text.isEmpty ||
                              _emailController.value.text.isEmpty ||
                              dateInput.value.text.isEmpty ||
                              _messageController.value.text.isEmpty) {
                            setState(() {
                              inactive = true;
                            });
                          } else if (inactive == false) {
                            // final Appoint = Provider.of<AppointmentProvider>(
                            //     context,
                            //     listen: false);
                            Appoint.bookAppointment(
                              context: context,
                              userId:widget.pastor_id,
                              pastor: widget.title,
                              time: _timeController.text,
                              date: dateInput.value.text,
                              email: _emailController.value.text,
                              reason: _messageController.value.text,
                              name: _nameController.text,
                            );
                          }
                        }, inactive ? Color(0xFF3E64FF) : Colors.red[300],
                            "Book now", 363, 60);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// akuetteh58@gmail.com
// Admin@1234