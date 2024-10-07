import 'package:build_app/constants/constant.dart';
import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Set the width of the drawer
      color: AppColors.darkGrey, // Change to your desired color
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 80,
              color: AppColors.darkGrey, 
              alignment: Alignment.center,// Match the background color
              child: Text(
                'Menu',
                style: SubHead
              ),
            ),
            Divider(
              
              thickness: 1, // Thickness of the divider
              color: Colors.grey, // Color of the divider
              height: 1, // Set the height of the divider (space taken)
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.lightbulb_circle, color: Colors.white),
              title: Text("What's new", style: LabelText),
              onTap: () {
                // Handle language change
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.white),
              title: Text('Listening history', style: LabelText),
              onTap: () {
                // Handle language change
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Settings and privacy', style: LabelText),
              onTap: () {
                // Handle navigation to settings
                Navigator.pop(context); // Close the drawer
              },
            ),
           
          ],
        ),
      ),
    );
  }
}
