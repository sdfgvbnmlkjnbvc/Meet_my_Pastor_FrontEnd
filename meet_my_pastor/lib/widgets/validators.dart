String? errorText(emailController){
  var status_in =false;
  final email=emailController.value.text;
 
  if(email.isNotEmpty && !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
   
    status_in=false;
    return " Enter a valid email address";


  }else if(email.isEmpty){
    return null;
  }
  else {
     status_in=true;
    return null;
  }}
  String? errorPassword(passwordController){
   var  status_in=false;
     final password=passwordController.value.text;
 if(!password.isEmpty && !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password)){
  status_in=false;
    return " Enter a stronger password. consider using upper Case,lower case numbers and Special Characters";

  }else if(password.isEmpty){
    status_in=false;
    return null;
  }
  else if (password.length <8){
    status_in=false;
    return "password should be longer than 8 Characters";
  }
  status_in=true;
return null;
}
String? confirmPassword(confirmPasswordController,passwordController){
 final cpassword=confirmPasswordController.value.text;
 final password=passwordController.value.text;
 if(cpassword.isNotEmpty&&  password !=cpassword ){
    return "Password don't match";

  }else if(cpassword.isEmpty){
    return null;
  }
}

String? validContact(contactController){
  final contact=contactController.value.text;
 
  if(contact.isNotEmpty && !RegExp(r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$").hasMatch(contact)){
    return " Enter a valid contact address";

  }else if(contact.isEmpty){
    return null;
  }
  else {
    return null;
  }}



String? validName(nameController){
  final name=nameController.value.text;
 
  if(name.isNotEmpty && !RegExp(r"(^[A-Za-z]{3,16})([ ]{0,1})([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})?([ ]{0,1})?([A-Za-z]{3,16})").hasMatch(name)){
    
    return " Enter a valid name ";

  }else if(name.isEmpty){
    return null;
  }
  else {
    return null;
  }}