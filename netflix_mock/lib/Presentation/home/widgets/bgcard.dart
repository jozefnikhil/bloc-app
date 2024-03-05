import 'package:flutter/material.dart';
import 'package:netflix_mock/Core/colors.dart';
import 'package:netflix_mock/Core/constant.dart';
import 'package:netflix_mock/Presentation/home/widgets/custom_button_widget.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: NetworkImage(kImage), fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustombuttonWidget(
                icon: Icons.add,
                title: 'My List',
                iconSize: 30,
                textSize: 18,
              ),
              playbutton(),
              const CustombuttonWidget(
                icon: Icons.info,
                title: 'Info',
                textSize: 18,
                iconSize: 30,
              ),
            ],
          ),
        )
      ],
    );
  }

  TextButton playbutton() {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhite)),
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
          color: Colors.black,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Play',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ));
  }
}
