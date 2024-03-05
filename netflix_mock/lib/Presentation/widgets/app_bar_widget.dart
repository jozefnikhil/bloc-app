import 'package:flutter/material.dart';
import 'package:netflix_mock/Core/colors.dart';
import 'package:netflix_mock/Core/constant.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          kWidth,
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            color: kWhite,
          ),
          kWidth,
          Container(
            width: 30,
            height: 30,
            color: Colors.blue,
          ),
          kWidth
        ],
      ),
    );
  }
}
