import 'package:build_app/constants/button.dart';
import 'package:build_app/constants/constant.dart';
import 'package:build_app/constants/textfield.dart';
import 'package:build_app/screens/component/navbar.dart';
import 'package:build_app/screens/component/social_media.dart';
import 'package:build_app/sub_page/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart'; // Import email validator

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSubmitted = false; // Flag to track submission attempt

@override
void initState() {
  super.initState();

  // Listen to changes in text fields
  emailController.addListener(_validateInputs);
  passwordController.addListener(_validateInputs);
}

@override
void dispose() {
  emailController.dispose();
  passwordController.dispose();
  super.dispose();
}


  // Validate inputs method
  void _validateInputs() {
    setState(() {
      // Check email format using the email_validator package
      isEmailValid = EmailValidator.validate(emailController.text);
      // Check password for minimum 6 characters, with at least one uppercase and one lowercase
      isPasswordValid = passwordController.text.length >= 6 &&
          RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).{6,}$').hasMatch(passwordController.text);
    });
  }

  // This method will handle form submission
  void _submitForm() {
    setState(() {
      isSubmitted = true; // Mark that form has been submitted
    });

    // Validate inputs before submission
    _validateInputs();

    // If the inputs are valid, navigate to the next screen
    if (isEmailValid && isPasswordValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => NavBar()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/small_logo.png',
              height: 50,
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome back!',
              style: Head2,
            ),
            const SizedBox(height: 30),
            MyTextFormField(
              controller: emailController,
              obscuretext: false,
              labelText: 'Email',
              hintText: 'Enter your email address',
            ),
            if (isSubmitted && !isEmailValid) // Show error message if email is invalid
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter a valid email address',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            MyTextFormField(
              controller: passwordController,
              obscuretext: true,
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
            if (isSubmitted && !isPasswordValid) // Show error message if password is invalid
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password must be at least 6 characters with at least one uppercase and one lowercase letter.',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.purpleAccent),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            BasicButton(
              onPressed: _submitForm, // Call _submitForm when the button is pressed
              title: 'Submit',
            ),
            const SizedBox(height: 30),
            SocialMedia(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account yet?",
                  style: LabelText,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SignUp(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.purpleAccent),
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
