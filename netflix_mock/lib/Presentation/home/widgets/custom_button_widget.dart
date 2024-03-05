import 'package:flutter/material.dart';
import 'package:netflix_mock/Core/colors.dart';

class CustombuttonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  const CustombuttonWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.iconSize,
      required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
