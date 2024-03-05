import 'package:flutter/material.dart';
import 'package:netflix_mock/Core/constant.dart';
import 'package:netflix_mock/Presentation/home/widgets/numbercard.dart';
import 'package:netflix_mock/Presentation/widgets/maintitle.dart';

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 Tv Shows In India Today'),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => NumberCard(
                      index: index + 1,
                    )),
          ),
        )
      ],
    );
  }
}
