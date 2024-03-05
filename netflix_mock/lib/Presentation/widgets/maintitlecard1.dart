import 'package:flutter/material.dart';
import 'package:netflix_mock/Core/constant.dart';
import 'package:netflix_mock/Presentation/widgets/main_card.dart';
import 'package:netflix_mock/Presentation/widgets/maintitle.dart';

class MainTitleCard1 extends StatelessWidget {
  const MainTitleCard1({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => const MainCard1()),
          ),
        )
      ],
    );
  }
}
