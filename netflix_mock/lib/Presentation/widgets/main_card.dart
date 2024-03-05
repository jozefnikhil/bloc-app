import 'package:flutter/material.dart';
import 'package:netflix_mock/Core/constant.dart';

class MainCard1 extends StatelessWidget {
  const MainCard1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: kRadius10,
          image: const DecorationImage(
              image: NetworkImage(
                  'https://m.media-amazon.com/images/M/MV5BMjE5MjkwODI3Nl5BMl5BanBnXkFtZTcwNjcwMDk4NA@@._V1_.jpg'),
              fit: BoxFit.contain)),
    );
  }
}
