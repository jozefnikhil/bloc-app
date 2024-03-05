import 'package:flutter/material.dart';
import 'package:netflix_mock/Presentation/downloads/widgets/screens_download.dart';
import 'package:netflix_mock/Presentation/fast%20laugh/screen_fast_laugh.dart';
import 'package:netflix_mock/Presentation/home/screen_home.dart';
import 'package:netflix_mock/Presentation/main%20page/widgets/bottom_nav.dart';
import 'package:netflix_mock/Presentation/new%20and%20hot/screen_new_and_hot.dart';
import 'package:netflix_mock/Presentation/search/screen_search.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final _pages = [
    const ScreenHome(),
    const NewAndHot(),
    const FastLaugh(),
    ScreenSearch(),
    DownloadScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, child) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: const BNAVW(),
    );
  }
}
