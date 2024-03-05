import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BNAVW extends StatelessWidget {
  const BNAVW({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (value) {
              indexChangeNotifier.value = value;
            },
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.collections,
                  ),
                  label: 'New and Hot'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.emoji_emotions_outlined,
                  ),
                  label: 'Fast Laughs'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search_off_outlined,
                  ),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.download_outlined,
                  ),
                  label: 'Downloads')
            ],
          );
        });
  }
}
