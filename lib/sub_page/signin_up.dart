import 'package:build_app/constants/button.dart';
import 'package:build_app/constants/constant.dart';
import 'package:build_app/sub_page/sign_in.dart';
import 'package:build_app/sub_page/sign_up.dart';
import 'package:flutter/material.dart';


class SignInUp extends StatelessWidget {
  const SignInUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 40,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/Background.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          
          children: [
            Image.asset('assets/images/Spotify.png', width: 80, height: 80),
        
            const SizedBox(height: 30),
            Text(
              'Millions of songs',
              style: Head
              ),
        
            
            Text(
              'Free on Spotify',
              style: Head
            ),
            const SizedBox(height: 30),
        
            BasicButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignUp()),
                  );
                },
                title: 'Sign up free'),
            const SizedBox(height: 10),
            SecondButton(
                onPressed: () {
                 
                },
                title: 'Continue with Google',
                imagePath: 'assets/images/google.png',
            ),
            const SizedBox(height: 10),
            SecondButton(
                onPressed: () {
                  
                },
                imagePath: 'assets/images/facebook.png',
                
                title: 'Continue with Facebook',),
                
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignIn()),
                  );
                },
             
              child: const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.purpleAccent
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
