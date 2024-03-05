import 'package:flutter/material.dart';
import 'package:netflix_mock/Core/colors.dart';
import 'package:netflix_mock/Core/constant.dart';

class VideoWidget extends StatelessWidget {
  VideoWidget({super.key, required this.img});
  String img;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.red,
          child: Image.network(
            img,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off,
                    color: kWhite,
                    size: 20,
                  ))),
        ),
      ],
    );
  }
}
