import 'package:build_app/constants/button.dart';
import 'package:build_app/constants/constant.dart';
import 'package:build_app/constants/textfield.dart';
import 'package:build_app/screens/component/navbar.dart';
import 'package:build_app/screens/component/social_media.dart';
import 'package:build_app/screens/sub_page/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart'; // Add this for email validation

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final usernameController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isConfirmPasswordValid = false;
  bool isUsernameUnique = true; // Assume it's unique initially
  bool canSubmit = false;
  bool isSubmitted = false; // Flag to track submission attempt

  @override
  void initState() {
    super.initState();

    // Listen to changes in text fields
    emailController.addListener(_validateInputs);
    passwordController.addListener(_validateInputs);
    confirmpasswordController.addListener(_validateInputs);
    usernameController.addListener(_validateInputs);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  // Dummy method to simulate username uniqueness check
  Future<bool> _checkUsernameUnique(String username) async {
    return Future.delayed(Duration(seconds: 1), () => true);
  }

  // Validate inputs method
  void _validateInputs() async {
    setState(() {
      // Check email format using the email_validator package
      isEmailValid = EmailValidator.validate(emailController.text);

      // Check password for minimum 6 characters, uppercase and lowercase
      isPasswordValid = passwordController.text.length >= 6 &&
          RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).{6,}$')
              .hasMatch(passwordController.text);

      // Check if passwords match
      isConfirmPasswordValid =
          passwordController.text == confirmpasswordController.text;
    });

    // Check username uniqueness (you might need to call an API or check a database)
    bool uniqueUsername = await _checkUsernameUnique(usernameController.text);

    setState(() {
      isUsernameUnique = uniqueUsername;
      canSubmit = isEmailValid &&
          isPasswordValid &&
          isConfirmPasswordValid &&
          isUsernameUnique;
    });
  }

  // This method will handle form submission
  void _submitForm() {
    setState(() {
      isSubmitted = true; // Mark that form has been submitted
    });

    if (canSubmit) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => NavBar()),
      );
    } else {
      // Show errors
      _validateInputs();
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
              'Create your account',
              style: Head2,
              ),
        
            const SizedBox(height: 30),
            MyTextFormField(
              controller: usernameController,
              obscuretext: false,
              labelText: 'Username',
              hintText: 'Enter your username',
            ),
            if (isSubmitted && !isUsernameUnique)
              Text(
                'Username is already taken.',
                style: TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 20),
            MyTextFormField(
              controller: emailController,
              obscuretext: false,
              labelText: 'Email',
              hintText: 'Enter your email address',
            ),
            if (isSubmitted && !isEmailValid)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter a valid email address',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 20),
            MyTextFormField(
              controller: passwordController,
              obscuretext: true,
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
            if (isSubmitted && !isPasswordValid)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password must be at least 6 characters with at least one uppercase and one lowercase letter.',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 20),
            MyTextFormField(
              controller: confirmpasswordController,
              obscuretext: true,
              labelText: 'Confirm password',
              hintText: 'Re-enter your password',
            ),
            if (isSubmitted && !isConfirmPasswordValid)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Passwords do not match.',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 30),
            BasicButton(
              onPressed:
                  _submitForm, // Call _submitForm when the button is pressed
              title: 'Submit',
            ),
            SizedBox(height: 30),
            SocialMedia(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: LabelText,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SignIn()),
                    );
                  },
                  child: Text(
                    'Sign in',
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
