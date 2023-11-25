import 'package:flutter/material.dart';
import 'package:meet_my_pastor/provider/auth/auth_provider.dart';
import 'package:meet_my_pastor/view/screens/reset_password.dart';
import 'package:meet_my_pastor/widgets/validators.dart';
import 'package:provider/provider.dart';

import '../../page_navigator.dart';
import '../../widgets/input_text_field.dart';
import '../../widgets/authentication.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120),
                Center(
                  child: Image.asset(
                    "images/login.png",
                    width: 236,
                    height: 254,
                  ),
                ),
                buildTextField(
                  _emailController,
                  "Email",
                  false,
                  const Icon(Icons.alternate_email, color: Colors.black),
                  errorText(_emailController),
                  () {},
                ),
                buildTextField(
                  _passwordController,
                  "Password",
                  !_isPasswordVisible,
                  _isPasswordVisible
                      ? const Icon(Icons.remove_red_eye_outlined,
                          color: Colors.black)
                      : const Icon(Icons.visibility_off, color: Colors.black),
                  errorPassword(_passwordController),
                  () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 12),
                  child: Row(
                    children: [
                      const Text("Forgot Password ? "),
                      InkWell(
                        onTap: () {
                          PageNavigator(ctx: context)
                              .nextPage(page: const ResetPassword());
                        },
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                Material(
                  child: Consumer<Authentication>(
                    builder: (context, auth, child) {
                      return buildRegisterButton(context, () {
                        final auth =
                            Provider.of<Authentication>(context, listen: false);
                        auth.loginUser(context: context,
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      }, const Color(0xFF3E64FF), "Login", 363, 60);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
