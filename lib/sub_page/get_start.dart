import 'package:build_app/constants/button.dart';
import 'package:build_app/constants/constant.dart';
import 'package:build_app/sub_page/signin_up.dart';
import 'package:flutter/material.dart';

class GetStart extends StatelessWidget {
  const GetStart({super.key});

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
                image: AssetImage('assets/images/rosy.png'),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Enjoy Listening to Music',
                  style: Head2
                  ),
                
                SizedBox(height: 21),
                Text(
                  'With the Spotify music and podcast app, you can play millions of songs, albums and original podcasts for free.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                BasicButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                   SignInUp()));
                    },
                    title: 'Get Started'),
                SizedBox(height: 15),
              ],
            ),
          ),
        
    );
   
  }
}
