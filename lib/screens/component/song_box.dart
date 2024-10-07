import 'package:build_app/constants/constant.dart';
import 'package:flutter/material.dart';

class SongBox extends StatelessWidget {
  final String title;
  final Image image;

  const SongBox({
    required this.title,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: image.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Title section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: TitleText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
