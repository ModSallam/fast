import 'package:fast/components/my_button.dart';
import 'package:fast/components/my_click_detector.dart';
import 'package:fast/components/my_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    super.key,
    required this.onTap,
  });

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // register method
  void register() {}

  // go to login page
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),
            // welcome back message
            Text(
              "Let's create an account for you",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // email text field
            MyTextFiled(
              hintText: "Email",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (email) {
                if (email == null || email.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // password text field
            MyTextFiled(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              validator: (password) {
                if (password == null || password.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // confirm password text field
            MyTextFiled(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              validator: (confirmPassword) {
                if (confirmPassword == null || confirmPassword.isEmpty) {
                  return "Please enter the confirm password";
                }
                if (confirmPassword != _passwordController.text) {
                  return "Passwords doesn't match";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 25,
            ),
            // login button
            MyButton(
              text: "Register",
              onTap: register,
            ),
            const SizedBox(
              height: 25,
            ),
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                MyClickDetector(
                  onTap: onTap,
                  child: const Text(
                    "Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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
