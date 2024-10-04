import 'package:build_app/constants/button.dart';
import 'package:build_app/constants/constant.dart';
import 'package:build_app/screens/component/profile_menu.dart';
import 'package:build_app/screens/sub_page/signin_up.dart';

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(  // Use SingleChildScrollView for scrolling if necessary
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 57,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 55,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.darkGrey,
                    radius: 17,
                    child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        Icons.edit,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Spacing after the profile picture
              Text(
                'Supitcha Lengvattanakit',
                style: SubHead,
              ),
              const SizedBox(height: 20), // Spacing before menu items
              ProfileMenu(
                title: 'Account',
                icon: Icons.person_2_rounded,
              ),
              ProfileMenu(
                title: 'Language',
                icon: Icons.language,
              ),
              ProfileMenu(
                title: 'Devices',
                icon: Icons.device_hub_rounded,
              ),
              ProfileMenu(
                title: 'Video Quality',
                icon: Icons.speaker,
              ),
              ProfileMenu(
                title: 'Notifications',
                icon: Icons.notifications,
              ),
              ProfileMenu(
                title: 'Privacy Policy',
                icon: Icons.verified_user_rounded,
              ),
              ProfileMenu(
                title: 'About',
                icon: Icons.question_mark_outlined,
              ),
              const SizedBox(height: 20), // Spacing before the button
              BasicButton(onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SignInUp()),
                    );
              }, title: 'Log out'),
            ],
          ),
        ),
      ),
    );
  }
}
