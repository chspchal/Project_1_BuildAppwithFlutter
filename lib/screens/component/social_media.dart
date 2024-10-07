import 'package:flutter/material.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              // Handle button tap
            },
            child: CircleAvatar(
              radius: 23, // Set the radius to control the size
              backgroundColor: Colors.white, // Set the background color
              child: ClipOval(
                child: Image.asset(
                  'assets/images/google.png',
                  width: 40, // Adjust image width
                  height: 40, // Adjust image height
                  fit: BoxFit.cover, // Ensure the image fits well
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Handle button tap
            },
            child: CircleAvatar(
              radius: 30, // Set the radius to control the size
              backgroundColor: Colors.transparent, // Set the background color
              child: ClipOval(
                child: Image.asset(
                  'assets/images/facebook.png',
                  width: 45, // Adjust image width
                  height: 45, // Adjust image height
                  fit: BoxFit.cover, // Ensure the image fits well
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
