import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_mock/Core/colors.dart';
import 'package:netflix_mock/Core/constant.dart';
import 'package:netflix_mock/Presentation/home/widgets/bgcard.dart';
import 'package:netflix_mock/Presentation/home/widgets/numberWidget.dart';
import 'package:netflix_mock/Presentation/widgets/maintitlecard1.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  print(direction);
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: const [
                        BackGroundCard(),
                        MainTitleCard1(
                          title: 'Released in the past year',
                        ),
                        kheight,
                        MainTitleCard1(
                          title: 'Trending Now',
                        ),
                        kheight,
                        NumberWidget(),
                        kheight,
                        MainTitleCard1(
                          title: 'Tense Dramas',
                        ),
                        kheight,
                        MainTitleCard1(
                          title: 'South Indian Cinema',
                        ),
                        kheight
                      ],
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 100,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://yt3.googleusercontent.com/ytc/AIf8zZQKCG8w7wVznj9sHhrHge3cKYVuUblDUuOaUp_psQ=s900-c-k-c0x00ffffff-no-rj',
                                      width: 50,
                                      height: 50,
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
                                kheight,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('TV Shows', style: khomeTextStyle),
                                    Text(
                                      'Movies',
                                      style: khomeTextStyle,
                                    ),
                                    Text(
                                      'Categories',
                                      style: khomeTextStyle,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        : kheight,
                  ],
                ),
              );
            }));
  }
}
