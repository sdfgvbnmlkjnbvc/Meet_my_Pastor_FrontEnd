import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meet_my_pastor/provider/apointment.dart';

import 'package:meet_my_pastor/widgets/authentication.dart';
import 'package:meet_my_pastor/widgets/build_datetime.dart';
import 'package:provider/provider.dart';

import '../../page_navigator.dart';
import '../../provider/auth/auth_provider.dart';
import '../../widgets/input_text_field.dart';
import 'appointment.dart';
import 'home.dart';

const List<BoxShadow> kInputBoxShadow = [
  BoxShadow(
    color: Colors.grey,
    offset: Offset(2.0, 2.0),
    blurRadius: 2.0,
    spreadRadius: 2.0,
  ),
  BoxShadow(
    color: Colors.white,
    offset: Offset(0.0, 0.0),
    blurRadius: 0.0,
    spreadRadius: 0.0,
  ),
];

class AppointmentDetail extends StatefulWidget {
  final String pastorId;
  final String title;
  const AppointmentDetail({
    Key? key,
    required this.pastorId,
    required this.title,
  }) : super(key: key);

  @override
  _AppointmentDetailState createState() => _AppointmentDetailState();
}

class _AppointmentDetailState extends State<AppointmentDetail> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  // final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool _isDateSelected = false;
  bool _isTimeSelected = false;

  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _dateController.text = "";
    _selectedTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    var userId = Provider.of<Authentication>(context);
    // print("User id: $userId");
    // bool inactive = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.blue,
            ),
            onPressed: () {
              PageNavigator(ctx: context)
                  .nextPageOnly(page: const Appointment());
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              PageNavigator(ctx: context).nextPageOnly(page: const HomePage());
            },
            icon: const Icon(color: Colors.blue, Icons.exit_to_app),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const SizedBox(height: 30),
            FieldInput(
                expand: false,
                controller: _emailController,
                width: 363,
                height: 50,
                labelText: "Email"),
            buildInputField(
              kInputBoxShadow: kInputBoxShadow,
              controller: _dateController,
              labelText: "Enter Date",
              isDateSelected: _isDateSelected,
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
                    _isDateSelected = true;
                    _dateController.text = formattedDate;
                  });
                }
              },
            ),
            buildInputField(
              kInputBoxShadow: kInputBoxShadow,
              controller: _timeController,
              labelText: "Enter Time",
              isTimeSelected: _isTimeSelected,
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: _selectedTime,
                );

                if (pickedTime != null && pickedTime != _selectedTime) {
                  setState(() {
                    _isTimeSelected = true;
                    _selectedTime = pickedTime;
                    _timeController.text =
                        _selectedTime.format(context); // Set the text
                    //   print("Selected Time: $_selectedTime");
                    //   print("stored in variable ${_timeController.text}");
                  });
                }
              },
            ),
            const SizedBox(height: 30),
            FieldInput(
              expand: true,
              controller: _messageController,
              height: 269,
              width: 363,
              labelText:
                  "Please lets us know in more details your reason for this apointment",
              labelTextStyle: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 30),
            Material(child: Consumer<AppointmentProvider>(
                builder: (context, appoint, child) {
              return buildRegisterButton(
                context,
                () {
                  // if (_nameController.value.text.isEmpty ||
                  //     _emailController.value.text.isEmpty ||
                  //     _messageController.value.text.isEmpty) {
                  //   setState(() {
                  //     inactive = true;
                  //   });
                  // } else if (!inactive) {
                  appoint.bookAppointment(
                    context: context,
                    // userId: widget.pastorId,
                    userId: userId.userId,
                    pastor: widget.title,
                    time: _timeController.text,
                    date: _dateController.text,
                    email: _emailController.value.text,
                    reason: _messageController.value.text,
                    name: userId.userName,
                    // );
                    //   }
                    // },
                  );
                },
                // inactive ? const Color(0xFF3E64FF) : Colors.red[300],
                const Color(0xFF3E64FF),
                "Book now",
                280,
                60,
              );
            })),
          ],
        ),
      ),
    );
  }
}
