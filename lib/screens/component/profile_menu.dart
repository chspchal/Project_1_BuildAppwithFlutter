import 'package:build_app/constants/constant.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  // Callback for when the button is tapped

  const ProfileMenu({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: Colors.white,
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: MenuText,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward_ios),
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
