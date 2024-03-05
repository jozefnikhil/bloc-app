import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_mock/Core/colors.dart';
import 'package:netflix_mock/Core/constant.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 130,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: kRadius10,
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://m.media-amazon.com/images/M/MV5BZjYzZDgzMmYtYjY5Zi00YTk1LThhMDYtNjFlNzM4MTZhYzgyXkEyXkFqcGdeQXVyMTE5NDQ1MzQ3._V1_.jpg'),
                      fit: BoxFit.contain)),
            ),
          ],
        ),
        Positioned(
            bottom: -20,
            left: 13,
            child: (BorderedText(
              strokeColor: kWhite,
              strokeWidth: 2.4,
              child: Text(
                '$index',
                style: const TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.black),
              ),
            )))
      ],
    );
  }
}
