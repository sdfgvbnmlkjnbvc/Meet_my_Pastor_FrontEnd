import 'package:flutter/material.dart';
import 'package:meet_my_pastor/provider/auth/auth_provider.dart';
import 'package:meet_my_pastor/view/screens/login.dart';
import 'package:provider/provider.dart';

import '../../pageNavigator.dart';
import '../../widgets/InputTextfield.dart';
import '../../widgets/authentication.dart';
import '../../widgets/validators.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  bool _eye = true;
  bool _ceye = true;
  bool _validate=false;

 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 70),
              Center(
                child: Image.asset("images/Register.png", width: 105, height: 101),
              ),
              const SizedBox(height: 60),
              Container(child: buildTextField(_nameController, "Full name", false,const Icon(Icons.person_pin_circle_outlined, color: Colors.black),validName(_nameController) ,() {})),
              buildTextField(_emailController, "Email", false,const Icon(Icons.alternate_email, color: Colors.black), errorText(_emailController), () {}),
              buildTextField(_contactController, "Contact", false,const Icon(Icons.phone_iphone_outlined, color: Colors.black),validContact(_contactController),() {}),
              buildTextField(_passwordController, "Password", _eye,_eye? const Icon(Icons.remove_red_eye_outlined, color: Colors.black) : const Icon(Icons.visibility_off,color: Colors.black,),errorPassword(_passwordController),() {
                setState(() {
                  _eye = !_eye;
                });
              }),
              buildTextField(_confirmPasswordController, "Confirm Password", _ceye,_ceye ? const Icon(Icons.remove_red_eye_outlined, color: Colors.black) : const Icon(Icons.visibility_off,color: Colors.black,), confirmPassword(_confirmPasswordController, _passwordController),() {
                setState(() {
                  _ceye = !_ceye;
                });
              }),
              const SizedBox(height: 60),
              Material(
                child: Consumer<Authentication>(
                  builder: (context, auth, child) {
                    if (_nameController.value.text.isEmpty || _emailController.value.text.isEmpty || _contactController.value.text.isEmpty || _passwordController.value.text.isEmpty){
return buildRegisterButton(context,(){
},Colors.red[300],"Register");
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

                    },Color(0xFF3E64FF),"Register");
                  }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account? "),
                    InkWell(onTap:(){
 pageNavigator(ctx: context).nextPage(page: Login());
                    },
                      child:Text(
                      "SignIn",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Admina@admin.com
// Admin@1234