import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? height;
  const BasicButton(
      {required this.onPressed, required this.title, this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style:
          ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height ?? 60)),
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class SecondButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final String imagePath;

  const SecondButton({
    required this.onPressed,
    required this.title,
    this.height,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          
          children: [
            Image.asset(
              imagePath,
              width: 28,
              height: 28,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center, // Centers the text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
