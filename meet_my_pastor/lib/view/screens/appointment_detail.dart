import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meet_my_pastor/widgets/authentication.dart';
import 'package:provider/provider.dart';

import '../../provider/auth/auth_provider.dart';
import '../../widgets/InputTextfield.dart';
import '../../widgets/validators.dart';

class EmailInput extends StatelessWidget {
  final String labelText;
  var height;
  var width;
   TextEditingController controller =TextEditingController();
   TextStyle? labelTextStyle;
   EmailInput({required this.labelText,this.width,this.height,labelTextStyle,controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: kInputBoxShadow,
      ),
      width: width,
      height:height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child:
          //  buildTextField(emailController, "Email", false,const Icon(Icons.alternate_email, color: Colors.black), errorText(emailController), () {}),
          TextField(
            controller: controller,
          expands: true,
           maxLines:null,
           minLines:null,
            decoration: InputDecoration(
           
             
              border: InputBorder.none,
              labelText: labelText,
              labelStyle:labelTextStyle ,
            ),
          ),
        ),
      ),
    );
  }
}

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
  AppointmentDetail({Key? key}) : super(key: key);

  @override
  _AppointmentDetailState createState() => _AppointmentDetailState();
}

class _AppointmentDetailState extends State<AppointmentDetail> {
  final TextEditingController dateInput = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  bool isDateSelected = false;

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           const SizedBox(height: 30,),
          //  buildTextField(_emailController, "Email", false,const Icon(Icons.alternate_email, color: Colors.black), errorText(_emailController), () {}),
         EmailInput(width: 363,height: 50,labelText: "Email"),
            Container(
               margin:const EdgeInsets.only(top: 10,left: 40, right: 40,bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                boxShadow: kInputBoxShadow,
              ),
              // padding:const EdgeInsets.all(15),
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
                    labelStyle: !isDateSelected ?  TextStyle(fontSize: 18, fontWeight: FontWeight.bold):TextStyle(fontSize: 0, fontWeight: FontWeight.bold),
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
              
           EmailInput(width: 363,height: 50,labelText: "Time"),
          const  SizedBox(height: 30,),
           EmailInput(height: 269,width: 363,labelText: "Please lets us know in more details your reason for this apointment",labelTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
          
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: buildRegisterButton(context, () => null,Color(0xFF3E64FF), "Book now"),

          ),
           Material(
                child: Consumer<Authentication>(
                  builder: (context, auth, child) {
                    if (_nameController.value.text.isEmpty || _emailController.value.text.isEmpty || _contactController.value.text.isEmpty || _passwordController.value.text.isEmpty){
return buildRegisterButton(context,(){
},Colors.red[300],"Book now");
                  } else{


                    return buildRegisterButton(context,(){

                         final auth = Provider.of<Authentication>(context, listen: false);
        auth.signup(
          context: context,
          contact: _contactController.text,
          email: _emailController.text,
          password: _passwordController.text,
          name: _nameController.text,
        );

                    },Color(0xFF3E64FF),"Book now");
                  }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
