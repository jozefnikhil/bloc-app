import 'package:flutter/material.dart';
import 'package:netflix_mock/Core/colors.dart';
import 'package:netflix_mock/Core/constant.dart';
import 'package:netflix_mock/Presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix_mock/Presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget(
      {super.key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                month,
                style: const TextStyle(
                    fontSize: 18, color: kGrey, letterSpacing: 4),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            VideoWidget(
              img: posterPath,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  movieName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18,
                      // letterSpacing: -3,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Row(
                  children: [
                    CustombuttonWidget(
                      icon: Icons.notifications_outlined,
                      title: 'Remind Me',
                      textSize: 12,
                      iconSize: 20,
                    ),
                    kWidth,
                    CustombuttonWidget(
                      icon: Icons.info_outline,
                      title: 'Info',
                      textSize: 12,
                      iconSize: 20,
                    ),
                  ],
                ),
                kWidth
              ],
            ),
            kheight,
            Text('Coming on $day $month'),
            kheight,
            // Text(
            //   description,
            //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            kheight,
            Text(
              description,
              style: const TextStyle(color: kGrey),
            )
          ]),
        ),
      ],
    );
  }
}
