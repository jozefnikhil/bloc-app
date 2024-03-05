import 'package:flutter/material.dart';
import 'package:netflix_mock/Core/colors.dart';
import 'package:netflix_mock/Core/constant.dart';
import 'package:netflix_mock/Presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_mock/Presentation/widgets/video_widget.dart';

class EveryonesWatching extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWatching(
      {super.key,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        const Text(
          'Friends',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          'Thus hit sitcom follow the merry misadventures of six 20 something as they navigate the pitfalls of work, life and love in 1990s Manhattan',
          style: TextStyle(color: kGrey),
        ),
        kheight50,
        // VideoWidget(),
        kheight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustombuttonWidget(
              icon: Icons.share,
              title: 'Share',
              textSize: 16,
              iconSize: 25,
            ),
            kWidth,
            CustombuttonWidget(
              icon: Icons.add,
              title: 'My List',
              textSize: 16,
              iconSize: 25,
            ),
            kWidth,
            CustombuttonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              textSize: 16,
              iconSize: 25,
            ),
            kWidth
          ],
        )
      ],
    );
  }
}
