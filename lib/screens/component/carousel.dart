import 'package:build_app/constants/constant.dart';
import 'package:build_app/screens/component/songs.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final String title;
  const Carousel({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: SubHead,
          ),
          const SizedBox(height: 10),
          const SizedBox(
            height: 200,
            child: Songs(),
          ),
        ],
      ),
    );
  }
}

class CarouselArtist extends StatelessWidget {
  final String title;
  const CarouselArtist({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: SubHead
          ),
          const SizedBox(height: 10),
          const SizedBox(
            height: 160,
            child: Artist(),
          ),
        ],
      ),
    );
  }
}
